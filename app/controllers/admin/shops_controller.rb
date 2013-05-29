# encoding: utf-8

class Admin::ShopsController < Admin::ApplicationController

  def index
    @shops = Shop.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @shop = Shop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @shop = Shop.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

   # POST /posts
  def create
    @shop = Shop.new(params[:shop])
    @shop.picture = uploadFile(params[:shop]["picture"]) 

    respond_to do |format|
      if @shop.save
        format.html { redirect_to admin_shop_url(@shop), notice: '添加成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @shop = Shop.find(params[:id])
    tmp =  params[:shop]
    tmp[:picture] = uploadFile(params[:shop]["picture"])  if params[:shop]["picture"]

    respond_to do |format|
      if @shop.update_attributes(tmp)
        format.html { redirect_to admin_shops_url, notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to admin_shops_url }
    end
  end

end
