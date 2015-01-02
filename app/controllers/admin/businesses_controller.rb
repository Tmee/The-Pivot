class Admin::BusinessesController < Admin::BaseAdminController
  load_and_authorize_resource

  def index
    @businesses = Business.order(id: :asc)
  end

  def update
    if @business.update_attributes(business_params)
      respond_to do |format|
        format.json { render json: @business.to_json }
        format.html { redirect_to admin_index_path}
      end
    else
      flash.now[:alert] = "The business was not updated. Please try again."
      render :back
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
    params.require(:business).permit(:name, :address, :state, :phone, :email, :slug, :url, :description, :active)
  end
end