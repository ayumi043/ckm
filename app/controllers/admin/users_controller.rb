# encoding: utf-8

class Admin::UsersController < Admin::ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    # @users = User.all
    @user = User.find(params[:id])
    # render 'index'
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        format.html { redirect_to admin_users_url, notice: '管理员添加成功.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    # @users = User.all
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        # binding.pry
        format.html { redirect_to admin_users_url, notice: '密码修改成功!' }
      else
        # binding.pry
        # format.html { render "index" }
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: '管理员删除成功!' }
    end
  end

end
