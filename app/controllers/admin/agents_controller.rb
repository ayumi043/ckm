# encoding: utf-8

class Admin::AgentsController < Admin::ApplicationController

  layout "admin"

  def index
    @agents = Agent.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @agent = Agent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @agent = Agent.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @agent = Agent.find(params[:id])
    @partners = Partner.where(
          :region_id => Region.find(@agent.region_id).leaves.map {|i| i.id }
    ) 
  end

   # POST /posts
  def create
    # binding.pry
    @agent = Agent.new(:region_id => params[:region_id], :partner_id => params[:partner_id])

    respond_to do |format|
      if @agent.save
        format.html { redirect_to admin_agents_url, notice: '添加成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @agent = Agent.find(params[:id])

    respond_to do |format|
      if @agent.update_attributes(:region_id => params[:region_id], :partner_id => params[:partner_id])
        format.html { redirect_to admin_agents_url, notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @agent = Agent.find(params[:id])
    @agent.destroy

    respond_to do |format|
      format.html { redirect_to admin_agents_url }
    end
  end

  def get_partners
    # @partners = Partner.where(:region_id => params[:id])
    # @partners = Partner.where(:region_id => [1537])
    # Partner.where(:region_id => Region.find(14).leaves.map {|i| i.id })
    @partners = Partner.where(
      :region_id => Region.find(params[:id]).leaves.map {|i| i.id }
    )
    render json: @partners
  end

end
