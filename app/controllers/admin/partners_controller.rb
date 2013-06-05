# encoding: utf-8

class Admin::PartnersController < Admin::ApplicationController

  def index
    @partners = Partner.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @partner = Partner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @partner = Partner.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @partner = Partner.find(params[:id])
  end

   # POST /posts
  def create
    @partner = Partner.new(params[:partner])
    @partner.picture = uploadFile(params[:partner]["picture"]) if params[:partner]["picture"]

    respond_to do |format|
      if @partner.save
        format.html { redirect_to admin_partner_url(@partner), notice: '添加成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @partner = Partner.find(params[:id])
    tmp =  params[:partner]
    tmp[:picture] = uploadFile(params[:partner]["picture"])  if params[:partner]["picture"]

    respond_to do |format|
      if @partner.update_attributes(tmp)
        format.html { redirect_to admin_partners_url, notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @partner = Partner.find(params[:id])
    @partner.destroy

    respond_to do |format|
      format.html { redirect_to admin_partners_url }
    end
  end

  def get_regions
    @regions = Region.find(params[:id]).children
    render json: @regions
  end

end
