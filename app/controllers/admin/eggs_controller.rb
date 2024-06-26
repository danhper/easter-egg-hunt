module Admin
  class EggsController < AdminController
    def create
      @egg = Egg.new(egg_params)
      if @egg.save
        User.all.each do |user|
          EggMailer.with(egg: @egg, user:).notify_new.deliver_later
        end
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
        User.all.each do |user|
          EggMailer.with(egg: @egg, user:).notify_update.deliver_later
        end
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
      params.require(:egg).permit(:input, :order, :expiry, :difficulty)
    end
  end
end
