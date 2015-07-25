class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

  def file_not_found; end

  def unprocessable; end

  def internal_server_error; end
end
