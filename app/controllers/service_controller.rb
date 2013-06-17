class ServiceController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.page(params[:page]).per(20) 
  end

end
