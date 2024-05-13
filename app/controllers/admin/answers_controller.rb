module Admin
  class AnswersController < AdminController
    def index
      @answers = Answer.includes(:user, :egg).with_attached_image
    end

    def show
      @answer = Answer.find(params[:id])
      @is_first = @answer == @answer.egg.answers.pending.order(submitted_at: :desc).first
    end

    def update
      @answer = Answer.find(params[:id])
      if @answer.update(answer_params)
        redirect_to admin_root_path, flash: { success: "Answer updated" }
      else
        redirect_to admin_root_path, flash: { danger: "Failed to update answer" }
      end
    end

    private

    def answer_params
      params.require(:answer).permit(:status)
    end
  end
end
