# encoding: utf-8

class Admin::QqsController < ApplicationController
  layout "admin"

	 def index
    @qqs = Qq.all

    respond_to do |format|
      format.html 
    end
  end

  def show
    @qq = Qq.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @qq = Qq.new
    # binding.pry
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @qq = Qq.find(params[:id])
  end

  def create
    @qq = Qq.new(params[:qq])
    respond_to do |format|
      if @qq.save
        format.html { redirect_to admin_qq_url(@qq), notice: '添加成功!' }
      else
        # binding.pry
        format.html { render action: "new" }
      end
    end
  end

  def update
    @qq = Qq.find(params[:id])
   
    respond_to do |format|
      if @qq.update_attributes(params[:qq])
        format.html { redirect_to admin_qq_url(@qq), notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @qq = Qq.find(params[:id])
    @qq.destroy

    respond_to do |format|
      format.html { redirect_to admin_qqs_url }
    end
  end

end
