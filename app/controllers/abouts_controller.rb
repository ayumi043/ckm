class AboutsController < ApplicationController

  def index
    
  end

  def show
    @abouts = About.where(:ty_id => [1,2,3,4])
    @about = About.find(params[:id])
  end

end
