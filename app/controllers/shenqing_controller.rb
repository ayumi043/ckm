# encoding: utf-8

class ShenqingController < ApplicationController

  def index
    @jiamengs = Jiameng.where(:ty_id => 5)
    @shenqing = Shenqing.new
    # render 
  end

  def create
    @shenqing = Shenqing.new(params[:shenqing])
    @jiamengs = Jiameng.where(:ty_id => 5)
    respond_to do |format|
      if @shenqing.save
        format.html { redirect_to "/shenqing", notice: '提交成功!' }
      else
        format.html { render action: "index" }
      end
    end
    
  end

end
