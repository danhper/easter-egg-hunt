class EggMailer < ApplicationMailer
  def notify_new
    @user = params[:user]
    @egg = params[:egg]
    mail(to: @user.email, subject: "A new Easter egg has been added")
  end

  def notify_update
    @user = params[:user]
    @egg = params[:egg]
    mail(to: @user.email, subject: "An Easter egg has been updated")
  end
end
