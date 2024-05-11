module Admin
  class DashboardController < AdminController
    def index
      @users = User.all
      @eggs = Egg.all
      @new_egg = Egg.new
    end
  end
end
