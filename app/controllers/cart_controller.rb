class CartController < ApplicationController

  def destroy
    session[:cart] = {}
    redirect_to :back
  end

  def show
    if session[:cart] != nil
      @listings = session[:cart].keys.map do |id|
        Listing.find(id)
      end
      @candidacy = Candidacy.new
    end
  end

  def update
    cart[params[:id]] = 1
    redirect_to :back
  end
end
