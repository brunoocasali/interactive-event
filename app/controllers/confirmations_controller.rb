class ConfirmationsController < Devise::ConfirmationsController

  def show
    @original_token = params[:confirmation_token]
    digested_token = Devise.token_generator
                         .digest(self, :confirmation_token, params[:confirmation_token])
    self.resource = resource_class.find_by_confirmation_token(digested_token) if
        params[:confirmation_token].present?

    super if resource.nil? or resource.confirmed?
  end

  def confirm
    confirmation_token = params[resource_name][:confirmation_token]
    @resource = resource
    digested_token = Devise.token_generator
                         .digest(self, :confirmation_token, confirmation_token)

    self.resource = resource_class.find_by_confirmation_token(digested_token) if
        confirmation_token.present?

    if update_attributes && match_passwords
      self.resource = resource_class.confirm_by_token(confirmation_token)

      set_flash_message :notice, :confirmed
      sign_in_and_redirect(resource_name, resource)
    else
      render action: :show
    end
  end

  private

  def match_passwords
    @resource.password_match?
  end

  def update_attributes
    attributes = params[resource_name].except(:confirmation_token)
                     .permit(:email, :password, :password_confirmation)

    @resource.update_attributes(attributes)
  end
end
