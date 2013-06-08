# encoding: utf-8

class ZsController < ApplicationController
  def index
    @zhaoshangs = Zhaoshang.where(:ty_id => 14)
    @zhaoshang = @zhaoshangs.first
    
  end
 
  def show 
    @zhaoshangs = Zhaoshang.where(:ty_id => 14)
    @zhaoshang = Zhaoshang.find(params[:id])
    render "index"
  end
end
