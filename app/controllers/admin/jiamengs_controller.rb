# encoding: utf-8

class Admin::JiamengsController < Admin::ApplicationController


  layout "admin"

  def index
    @jiamengs = Jiameng.where(:ty_id => 5)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @jiameng = Jiameng.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @jiameng = Jiameng.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @jiameng = Jiameng.find(params[:id])
  end

  def create
    @jiameng = Jiameng.new(params[:jiameng])
    @jiameng.pulishdate = Time.now
    @jiameng.ty_id = 5

    respond_to do |format|
      if @jiameng.save
        format.html { redirect_to admin_jiameng_url(@jiameng), notice: '添加成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @jiameng = Jiameng.find(params[:id])

    respond_to do |format|
      if @jiameng.update_attributes(params[:jiameng])
        format.html { redirect_to admin_jiamengs_url, notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @jiameng = Jiameng.find(params[:id])
    @jiameng.destroy

    respond_to do |format|
      format.html { redirect_to admin_jiamengs_url }
    end
  end


end
