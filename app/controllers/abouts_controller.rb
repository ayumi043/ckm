# encoding: utf-8

class AboutsController < ApplicationController

  def show
    @abouts = About.where(:ty_id => [1,2,4], :state => 1).select("id, title")
    @about = About.find(params[:id])
  end
end
