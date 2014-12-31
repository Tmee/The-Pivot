class Admin::BusinessesController < Admin::BaseAdminController
  load_and_authorize_resource

  def index
    @businesses = Business.order(id: :asc)
  end

  def update
    if @business.update_attributes(business_params)
      redirect_to admin_index_path, notice: "You have updated a product."
    else
      flash.now[:alert] = "The product was not updated. Please try again."
      render :edit
    end
  end

  def show
  end

  def destroy
    @business.destroy
    redirect_to admin_path, notice: "The business was deleted."
  end


  private

  def business_params
    params.require(:business).permit(:name, :address, :state, :phone, :email, :slug, :url, :description)
  end
end