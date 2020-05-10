class CustomersController < ApplicationController
  # before_action :authenticate_customer! except: [:top, :index]
  def index
  	@photos = Photo.page(params[:page]).reverse_order
  end

  def show
  	@customer = Customer.find(params[:id])
  end

  def favolist
    @customer = Customer.find(params[:id])
      # ここからサンプルとして記述しますね @sakuma
    @favoList = Favorite.select(:photo_id).where(customer_id: @customer.id)
    @favophotolist = Photo.where(id: @favoList)
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def destroy_cus
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to request.referer
  end

  def update
  	@customer = Customer.find(params[:id])
  	@customer.update(customer_params)
  	redirect_to customer_path(@customer.id)
  end

  def following
    @customer = Customer.find(params[:id])
  end

  def followed
    @customer =Customer.find(params[:id])
  end

  private
  def customer_params
  	params.require(:customer).permit(:name, :profile_image)
  end
end
