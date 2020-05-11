class FavoritesController < ApplicationController
	before_action :authenticate_customer!
	def create
		photo = Photo.find(params[:photo_id])
		favorite = current_customer.favorites.new(photo_id: photo.id)
		favorite.save
		redirect_to request.referer
    end
    def destroy
    	photo = Photo.find(params[:photo_id])
		favorite = current_customer.favorites.find_by(photo_id: photo.id)
		favorite.destroy
		redirect_to request.referer
    end
end
