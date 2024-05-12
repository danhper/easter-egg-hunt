class UserMailer < ApplicationMailer
  def login_email
    @user = params[:user]
    @url = authorize_url(token: params[:magic_link].token)
    mail(to: @user.email, subject: "Login to Olivier's Wedding Egg Hunt")
  end
end
