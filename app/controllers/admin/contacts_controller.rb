module Admin
  class ContactsController < ApplicationController
    skip_before_action :authenticate_user!, only: :create

    def index
      @contacts = Contact.all.page params[:page]

      respond_with(@contacts)
    end

    def create
      @contact = Contact.new(contact_params)

      if @contact.save
        redirect_to root_path, notice: 'Obrigado! Contato armazenado com sucesso!'
      else
        redirect_to root_path, alert: @contact.errors.full_messages.first
      end
    end

    private

    def contact_params
      params.require(:contact).permit(:email)
    end
  end
end
