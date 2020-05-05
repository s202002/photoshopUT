class PhotosController < ApplicationController
  def index
  	@photos = Photo.all
  end

  def show
  	@photo = Photo.find(params[:id])
  end

  def new
  	@photo = Photo.new
  end

  def create
  	@photo = Photo.new(photo_params)
    @photo.customer = current_customer
  	if @photo.save
  		redirect_to photos_path
  	else
  		redirect_back(fallback_location: root_path)
  	end
  end

  def edit
  	@photo = Photo.find(params[:id])
  end

  private
  def photo_params
  	params.require(:photo).permit(:name, :title, :explain, :place, :tag)
  end
end
