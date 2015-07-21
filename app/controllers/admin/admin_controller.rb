module Admin
  class AdminController < ApplicationController
    layout 'admin'

    def current_ability
      @current_ability ||= AdminAbility.new(current_user)
    end
  end
end
