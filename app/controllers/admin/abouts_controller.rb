# encoding: utf-8

class Admin::AboutsController < Admin::ApplicationController

  layout "admin"

  def index
    @abouts = About.where(:ty_id => [1,2,3,4])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @about = About.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @about = About.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @about = About.find(params[:id])
  end

  def create
    @about = About.new(params[:about])
    @about.pulishdate = Time.now
    @about.ty_id = 1

    respond_to do |format|
      if @about.save
        format.html { redirect_to admin_about_url(@about), notice: '添加成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @about = About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        format.html { redirect_to admin_abouts_url, notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @about = About.find(params[:id])
    @about.destroy

    respond_to do |format|
      format.html { redirect_to admin_abouts_url }
    end
  end

end
