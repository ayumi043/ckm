class Admin::AboutsController < ApplicationController

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

  def edit
    @about = About.find(params[:id])
  end

  def update
    @about = About.find(params[:id])

    respond_to do |format|
      if @about.update_attributes(params[:about])
        format.html { redirect_to admin_abouts_url, notice: 'about was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

end
