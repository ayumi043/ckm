# encoding: utf-8

class Admin::DownloadsController < Admin::ApplicationController

	layout "admin"

  def index
    @downloads = Download.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @download = Download.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @download = Download.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @download = Download.find(params[:id])
  end

   # POST /posts
  def create
    @download = Download.new(params[:download])
    respond_to do |format|
      if @download.save
        format.html { redirect_to admin_download_url(@download), notice: '下载添加成功!' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @download = Download.find(params[:id])

    respond_to do |format|
      if @download.update_attributes(params[:download])
        format.html { redirect_to admin_downloads_url, notice: '下载修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @download = Download.find(params[:id])
    @download.destroy

    respond_to do |format|
      format.html { redirect_to admin_downloads_url }
    end
  end

end
