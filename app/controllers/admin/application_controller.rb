class Admin::ApplicationController < ApplicationController

  # binding.pry
  before_filter :authenticate

  layout "admin"

  private

  def authenticate
    
    # authenticate_or_request_with_http_basic do |user_name, password|
    #   user_name == 'admin' && password == 'password'
    # end

    redirect_to new_admin_session_path unless session[:user_id]

  end

end
