class AnswerMailer < ApplicationMailer
  def notify_new
    @admin = params[:admin]
    @answer = params[:answer]
    mail(to: @admin.email, subject: "New answer received")
  end

  def notify_update
    @admin = params[:admin]
    @answer = params[:answer]
    mail(to: @admin.email, subject: "Answer updated")
  end
end
