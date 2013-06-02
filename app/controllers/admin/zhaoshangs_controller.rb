# encoding: utf-8

class Admin::ZhaoshangsController < Admin::ApplicationController

  layout "admin"

  def index
    @zhaoshangs = Zhaoshang.where(:ty_id => 14)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @zhaoshang = Zhaoshang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @zhaoshang = Zhaoshang.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @zhaoshang = Zhaoshang.find(params[:id])
  end

   # POST /posts
  def create
    @zhaoshang = Zhaoshang.new(params[:zhaoshang])
    @zhaoshang.pulishdate = Time.now
    @zhaoshang.ty_id = 14
    respond_to do |format|
      if @zhaoshang.save
        format.html { redirect_to admin_zhaoshang_url(@zhaoshang), notice: '添加成功!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @zhaoshang = Zhaoshang.find(params[:id])

    respond_to do |format|
      if @zhaoshang.update_attributes(params[:zhaoshang])
        format.html { redirect_to admin_zhaoshangs_url, notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @zhaoshang = Zhaoshang.find(params[:id])
    @zhaoshang.destroy

    respond_to do |format|
      format.html { redirect_to admin_zhaoshangs_url }
    end
  end


end
