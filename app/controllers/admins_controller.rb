class AdminsController < ApplicationController
  def index
  	@customer = Customer.all
  end

  def show
  	@photos = Photo.all
  end

  def edit
  end
end
