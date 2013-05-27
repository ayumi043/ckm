# encoding: utf-8

class Admin::SessionsController < ApplicationController

  # layout "admin", :except => [:new, :create]
  layout false

  def new
    @user = User.new
    # binding.pry

    # render :layout => false
  end
  
  def create

    respond_to do |format|
      @user = User.authenticate(params[:username], params[:password])
      if @user
        session[:user_id] = @user.id
        session[:username] = @user.username
        @user.update_attributes(:username => params[:username], :password => params[:password])
        # flash[:notice] = "欢迎您， #{@user.username}"
        # redirect_to posts_path
        format.html { redirect_to "/admin", notice: "欢迎您， #{@user.username}" }
      else
        binding.pry
        flash[:notice] = "登录失败，用户名，或密码错误！"
        # redirect_to new_admin_session_path
        format.html { render action: "new" }
      end
    end

  end

  def destroy
    # binding.pry
    session[:user_id] = nil
    session[:username] = nil
    redirect_to admin_path
  end

end
