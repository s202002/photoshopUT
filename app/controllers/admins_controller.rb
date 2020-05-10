class AdminsController < ApplicationController
  def index
  	@customers = Customer.all
  end

  def show
  	@photos = Photo.all
  end

  def edit
  end
end
