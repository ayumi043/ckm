# encoding: utf-8

class JiamengController < ApplicationController

  def index
    @jiamengs = Jiameng.where(:ty_id => 5)
    @jiameng = @jiamengs.first
    
  end
 
  def show 
    @jiamengs = Jiameng.where(:ty_id => 5)
    @jiameng = Jiameng.find(params[:id])
  end

end
