class CartController < ApplicationController
  def destroy
    session[:cart] = {}
    redirect_to :back
  end

  def show
    @listings = session[:cart].keys.map do |id|
      Listing.find(id)
    end
  end

  def update
    session[:cart][params[:id]] = 1
    redirect_to :back
  end
end
