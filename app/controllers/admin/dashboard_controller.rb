module Admin
  class DashboardController < AdminController
    def index
      @users = User.all
      @new_user = User.new
    end
  end
end
