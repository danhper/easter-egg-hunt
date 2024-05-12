module Admin
  class AdminController < ActionController::Base
    layout "admin_application"
    http_basic_authenticate_with name: "olivier", password: "secret"
  end
end
