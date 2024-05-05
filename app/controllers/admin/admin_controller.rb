module Admin
  class AdminController < ApplicationController
    http_basic_authenticate_with name: "olivier", password: "secret"
  end
end
