module Admin
  class DashboardController < AdminController
    def index
      @users = User.all
      @eggs = Egg.all
      @new_egg = Egg.new
      @answers = Answer.pending.includes(:user, :egg).with_attached_image
    end
  end
end
