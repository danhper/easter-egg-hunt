class StaticController < ApplicationController
  def rules
    @rules = Settings.rules
  end

  def not_found
    render :error, status: :not_found
  end

  def internal_server_error
    render :error, status: :not_found
  end
end
