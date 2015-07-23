class WelcomeController < ApplicationController
  layout 'welcome'
  skip_before_action :authenticate_user!

  def index
    @contact = Contact.new

    respond_with(@contact, location: root_path)
  end
end
