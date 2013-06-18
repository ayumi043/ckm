# encoding: utf-8

class ZsController < ApplicationController
  def index
    @zhaoshangs = Zhaoshang.where(:ty_id => 14)
    @zhaoshang = @zhaoshangs.first
    @zhaoshang.view = @zhaoshang.view.to_i + 1
    @zhaoshang.save
  end
 
  def show 
    @zhaoshangs = Zhaoshang.where(:ty_id => 14)
    @zhaoshang = Zhaoshang.find(params[:id])
    @zhaoshang.view = @zhaoshang.view.to_i + 1
    @zhaoshang.save
    render "index"
  end
end
