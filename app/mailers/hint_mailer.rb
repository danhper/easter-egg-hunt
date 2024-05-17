class HintMailer < ApplicationMailer
  def notify_new
    @user = params[:user]
    @hint = params[:hint]
    mail(to: @user.email, subject: "A new hint has been added")
  end
end
