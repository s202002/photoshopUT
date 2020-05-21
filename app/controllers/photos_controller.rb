class PhotosController < ApplicationController
  before_action :authenticate_customer!

  def index
    @photos = Photo.page(params[:page]).reverse_order
  end

  def show
  	@photo = Photo.find(params[:id])
    geo_data = Geocoder.search(@photo.place)
    @lat = geo_data[0].data["lat"].to_f
    @lon = geo_data[0].data["lon"].to_f
    @comment = Comment.new
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
    @photo.customer = current_customer
  	if @photo.save
      flash[:notice] = "投稿できました！！"
  		redirect_to photos_path
  	else
  		render "new"
  	end
  end

  def edit
  	@photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update(photo_params)
    redirect_to photo_path(@photo.id)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def photo_params
  	params.require(:photo).permit(:name, :title, :explain, :place, :tag, :image)
  end
end
