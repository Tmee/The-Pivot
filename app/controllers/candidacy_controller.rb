class CandidacyController < ApplicationController


  def new
    @candidacy = Candidacy.new
  end

  def create
    listing = Listing.find(params[:listing_id])
    listing.business_id
    @candidacy = Candidacy.create(listing_id: params[:listing_id],
                                  user_id: current_user.id)
  end

end
