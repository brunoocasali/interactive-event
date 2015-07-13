class Admin::AdminController < ApplicationController
  layout 'admin'
  before_filter :verify_admin
  before_filter :authenticate_user!

  def verify_admin
    :authenticate_user!
    redirect_to root_url unless current_user.admin? || current_user.root?
  end

  def current_ability
    @current_ability ||= AdminAbility.new(current_user)
  end
end
