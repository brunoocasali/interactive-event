class WelcomeController < ApplicationController
  skip_before_action only: :index

  def index; end
end
