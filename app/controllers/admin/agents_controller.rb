class Admin::AgentsController < ApplicationController

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
    @province = Province.all.first

  end

   # POST /posts
  def create
    @agent = Agent.new(params[:agent])

    respond_to do |format|
      if @agent.save
        format.html { redirect_to admin_agent_url(@agent), notice: '添加成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @agent = Agent.find(params[:id])

    respond_to do |format|
      if @agent.update_attributes(params[:agent])
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

end
