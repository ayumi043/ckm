# encoding: utf-8

class Admin::ShenqingsController < Admin::ApplicationController

  layout "admin"

  def index
    @shenqings = Shenqing.all
    respond_to do |format|
      format.html
    end
  end

  def show
    @shenqing = Shenqing.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def destroy
    @shenqing = Shenqing.find(params[:id])
    @shenqing.destroy

    respond_to do |format|
      format.html { redirect_to admin_shenqings_url }
    end
  end

end
