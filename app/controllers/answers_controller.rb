class AnswersController < ApplicationController
  before_action :find_egg, only: %i[create update]

  def create
    @answer = @egg.answers.build(answer_params)
    @answer.user = current_user
    if @answer.save
      User.admin.each { |admin| AnswerMailer.with(admin:, answer: @answer, new: true).notify_answer.deliver_later }
      redirect_to egg_path(@egg), flash: { success: "Answer submitted!" }
    else
      render "eggs/show"
    end
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update({ image: nil, status: "pending", submitted_at: Time.now }.merge(answer_params))
      User.admin.each { |admin| AnswerMailer.with(admin:, answer: @answer, new: false).notify_answer.deliver_now }
      redirect_to egg_path(@egg), flash: { success: "Answer updated!" }
    else
      render "eggs/show"
    end
  end

  private

  def find_egg
    @egg = Egg.find(params[:egg_id])
    redirect_to root_path, flash: { alert: "Egg not found!" } unless @egg && !@egg.expired?
  end

  def answer_params
    params.require(:answer).permit(:answer, :image)
  end
end
