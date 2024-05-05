module Admin
  class UsersController < AdminController
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_root_path, notice: "User #{@user.name} created"
      else
        redirect_to admin_root_path, alert: "Could not create user"
      end
    end

    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to admin_root_path, notice: "User deleted"
    end

    private

    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
end
