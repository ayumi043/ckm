# encoding: utf-8

class Admin::ProductsController < Admin::ApplicationController
  layout "admin"

  def index
    @products = Product.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @product = Product.new
    binding.pry
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(params[:product])
    @product.date = Time.now
    @product.picture = uploadFile(params[:product]["picture"])    

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: '产品添加成功!' }
      else
        binding.pry
        format.html { render action: "new" }
      end
    end
  end

  def update
    @product = Product.find(params[:id])
    tmp =  params[:product]
    tmp[:picture] = uploadFile(params[:product]["picture"])  if params[:product]["picture"]
   
    respond_to do |format|
      if @product.update_attributes(tmp)
        format.html { redirect_to admin_product_url(@product), notice: '产品修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url }
    end
  end

end
