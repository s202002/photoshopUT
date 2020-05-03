class CustomersController < ApplicationController
  # before_action :authenticate_customer! except: [:top, :index]
  def index
  	@photos = Photo.page(params[:page]).reverse_order
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def favorist
    @customer = Customer.find(params[:id])
      # ここからサンプルとして記述しますね @sakuma
    @favoList = Favorite.select(:photo_id).where(customer_id: @customer.id)
    @favoPhotoList = Photo.where(id: @favoList)
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to customer_path(@customer.id)
  end

  private
  def customer_params
  	params.require(:customer).permit(:name, :profile_image)
  end
end
