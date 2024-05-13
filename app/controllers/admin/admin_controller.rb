module Admin
  class AdminController < ApplicationController
    layout "admin_application"

    protected

    def authenticate_user!
      redirect_to root_path unless current_user && current_user.admin?
    end
  end
end
