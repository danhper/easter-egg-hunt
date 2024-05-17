class AnswerMailer < ApplicationMailer
  def notify_answer
    @admin = params[:admin]
    @answer = params[:answer]
    @new = params[:new]
    subject = @new ? "New answer received" : "Answer updated"
    mail(to: @admin.email, subject:)
  end

  def notify_response
    @answer = params[:answer]
    mail(to: @answer.user.email, subject: "Your answer has been #{@answer.accepted? ? "accepted" : "rejected"}")
  end
end
