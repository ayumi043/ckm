# encoding: utf-8

class ContactController < ApplicationController

  def index
    @abouts = About.where(:ty_id => [1,2,4], :state => 1).select("id, title")
    @about = About.where(:ty_id => 1, :state => 1).at(2)
  end

end
