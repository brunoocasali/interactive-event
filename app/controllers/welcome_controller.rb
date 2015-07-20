class WelcomeController < ApplicationController
  layout 'welcome'
  skip_before_action :authenticate_user!

  def index; end
end
