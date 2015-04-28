class ProfilesController < ApplicationController
  def dashboard
    if current_user.root? || current_user.admin?
      redirect_to admin_root_path, notice: 'Aloah Admin!'
    else
      respond_to do |format|
        format.html # dashboard.html.erb
      end
    end
  end
end
