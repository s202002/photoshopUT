class CommentsController < ApplicationController
  before_action :authenticate_customer!
	def create
		photo = Photo.find(params[:photo_id])
		comment = current_customer.comments.new(comment_params)
		comment.photo_id = photo.id
		comment.save
		redirect_to request.referer
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
