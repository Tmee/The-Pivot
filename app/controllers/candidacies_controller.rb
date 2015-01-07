class CandidaciesController < ApplicationController

  def new
    @candidacy = Candidacy.new
  end

  def index
    @candidacies = Candidacy.where(listing_id: params[:id]).pending
  end

  def create
    listing = Listing.find(params[:listing_id])
    listing.business_id
    @candidacy = Candidacy.create(listing_id: params[:listing_id],
                                  user_id: current_user.id,
                                  letter_to_business: params[:candidacy][:letter_to_business])

    BusinessesMailer.candidacy_email(@candidacy).deliver
    flash[:notice] = "Your application for #{listing.title} has been received and is pending."
    redirect_to cart_path
  end

  def accept
    candidacy = Candidacy.find_by_id(params[:id])
    candidacy.accept
    redirect_to :back
  end

  def reject
    candidacy = Candidacy.find_by_id(params[:id])
    candidacy.reject
    redirect_to :back
  end

private


end
