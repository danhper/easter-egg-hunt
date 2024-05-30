class EggMailer < ApplicationMailer
  def notify_new
    @user = params[:user]
    @egg = params[:egg]
    mail(to: @user.email, subject: "A new Easter egg has been added")
  end
end
