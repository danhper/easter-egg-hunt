module Admin
  class HintsController < AdminController
    def create
      @egg = Egg.find(params[:egg_id])
      @hint = @egg.hints.build(hint_params)
      if @hint.save
        User.all.each { |user| HintMailer.with(user:, hint: @hint).notify_new.deliver_later }
        redirect_to edit_admin_egg_path(@egg), notice: "Hint created"
      else
        redirect_to edit_admin_egg_path(@egg), alert: "Could not create hint"
      end
    end

    def destroy
      @hint = Hint.find(params[:id])
      @hint.destroy
      redirect_to edit_admin_egg_path(@hint.egg), notice: "Hint deleted"
    end

    private

    def hint_params
      params.require(:hint).permit(:content, :image)
    end
  end
end
