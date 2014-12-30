class CartController < ApplicationController
  def destroy
    session[:cart] = {}
    redirect_to :back
  end

  def show
    if session[:cart] == nil
      redirect_to :back, notice: "You must be logged in to view your job basket"
    else
      @listings = session[:cart].keys.map do |id|
        Listing.find(id)
      end
    end
  end

  def update
    session[:cart][params[:id]] = 1
    redirect_to :back
  end
end
