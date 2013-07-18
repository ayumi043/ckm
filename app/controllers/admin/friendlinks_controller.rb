# encoding: utf-8

class Admin::FriendlinksController < Admin::ApplicationController

	layout "admin"

  def index
    @friendlinks = Friendlink.all

    respond_to do |format|
      format.html
    end
  end

  def new
    @friendlink = Friendlink.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @friendlink = Friendlink.find(params[:id])
  end

   # POST /posts
  def create
    @friendlink = Friendlink.new(params[:friendlink])
    respond_to do |format|
      if @friendlink.save
        format.html { redirect_to admin_friendlinks_url, notice: '添加成功!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @friendlink = Friendlink.find(params[:id])

    respond_to do |format|
      if @friendlink.update_attributes(params[:friendlink])
        format.html { redirect_to admin_friendlinks_url, notice: '下载修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @friendlink = Friendlink.find(params[:id])
    @friendlink.destroy

    respond_to do |format|
      format.html { redirect_to admin_friendlinks_url }
    end
  end

end
