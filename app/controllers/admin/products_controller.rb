class Admin::ProductsController < ApplicationController

  layout "admin"

  # GET /posts
  def index
    @products = Product.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /posts/1
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /posts/new
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /posts/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /posts
  def create
    @product = Product.new(params[:product])
    @product.date = Time.now
    @product.picture = uploadFile(params[:product]["picture"])    
    binding.pry

    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_product_url(@product), notice: '产品添加成功!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to admin_product_url(@product), notice: '产品修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to admin_products_url }
    end
  end

end
