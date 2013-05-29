# encoding: utf-8

class Admin::TeamsController < Admin::ApplicationController

  def index
    @teams = Team.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @team = Team.find(params[:id])
  end

   # POST /posts
  def create
    @team = Team.new(params[:team])
    @team.picture = uploadFile(params[:team]["picture"]) 

    respond_to do |format|
      if @team.save
        format.html { redirect_to admin_team_url(@team), notice: '添加成功！' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @team = Team.find(params[:id])
    tmp =  params[:team]
    tmp[:picture] = uploadFile(params[:team]["picture"])  if params[:team]["picture"]

    respond_to do |format|
      if @team.update_attributes(tmp)
        format.html { redirect_to admin_teams_url, notice: '修改成功!' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to admin_teams_url }
    end
  end

end
