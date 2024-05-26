class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def current_user
    return @current_user if @current_user

    if (user_id = session[:user_id])
      @current_user = User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        login(user)
        @current_user = user
      end
    end
  end

  helper_method :current_user

  def login(user)
    session[:user_id] = user.id
  end

  protected

  def authenticate_user!
    redirect_to login_path, flash: { info: "Please login" } unless current_user
  end
end
