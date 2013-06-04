class AboutsController < ApplicationController

  def show
    @abouts = About.where(:ty_id => [1,2,3,4], :state => 1)
    # where("author=?", params[:author_id])
    @about = About.find(params[:id])
  end

end
