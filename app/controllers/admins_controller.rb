class AdminsController < ApplicationController
  before_action :authenticate_admin!
  def index
  	@customers = Customer.all
  end

  def show
  	@photos = Photo.all
  end

  def edit
  end
end
