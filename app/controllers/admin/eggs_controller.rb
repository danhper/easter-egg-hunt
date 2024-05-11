module Admin
  class EggsController < AdminController
    def create
      @egg = Egg.new(egg_params)
      if @egg.save
        redirect_to admin_root_path, notice: "Easter egg created"
      else
        redirect_to admin_root_path, alert: "Could not create egg"
      end
    end

    def edit
      @egg = Egg.find(params[:id])
      @hint = @egg.hints.build
    end

    def update
      @egg = Egg.find(params[:id])
      if @egg.update(egg_params)
        redirect_to admin_root_path, notice: "Easter egg updated"
      else
        redirect_to admin_root_path, alert: "Could not update egg"
      end
    end

    def destroy
      @egg = Egg.find(params[:id])
      @egg.destroy
      redirect_to admin_root_path, notice: "Easter egg deleted"
    end

    private

    def egg_params
      params.require(:egg).permit(:input, :order)
    end
  end
end
