class SessionsController < ApplicationController
  before_action :redirect_to_root, only: %i[new initiate create], unless: -> { current_user.nil? }
  skip_before_action :authenticate_user!

  def new
  end

  def initiate
    @user = User.find_by(email: session_params[:email])

    if @user.nil?
      redirect_to login_path, flash: { danger: "User not found" }
    else
      @magic_link = MagicLink.create!(user: @user)
      UserMailer.with(user: @user, magic_link: @magic_link).login_email.deliver_now
      redirect_to login_path, flash: { success: "Magic link sent to #{session_params[:email]}" }
    end
  end

  def create
    token = MagicLink.find_by(token: params[:token])
    if token.nil? || token.expired?
      magic_link&.destroy
      redirect_to login_path, flash: { danger: "Magic link is invalid, used or expired" }
    else
      session[:user_id] = token.user.id
      redirect_to root_path
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

  private

  def redirect_to_root
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:email)
  end
end
