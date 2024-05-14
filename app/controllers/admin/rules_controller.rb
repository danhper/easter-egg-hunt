module Admin
  class RulesController < AdminController
    def edit
      @settings = Settings.instance
    end

    def update
      @settings = Settings.instance
      if @settings.update(settings_params)
        redirect_to admin_root_path, notice: "Settings updated successfully"
      else
        render :edit
      end
    end

    private

    def settings_params
      params.require(:settings).permit(:rules)
    end
  end
end
