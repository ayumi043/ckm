class ServiceController < ApplicationController

  def index
    @categories = Category.all
    @products = Product.page(params[:page]).per(20) 
  end

  def show
		@product = Product.find(params[:id])

		respond_to do |format|
		  format.html
		end
  end

  def category
  	@category = Category.find(params[:id])
    @products = @category.products.page(params[:page]).per(20)
    render "index"
  end

end
