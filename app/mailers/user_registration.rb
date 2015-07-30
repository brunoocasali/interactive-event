class UserRegistration < ApplicationMailer
  def first_instructions(user)
    @user = user
    @user.reset_password_token = Devise.token_generator.generate(User, :reset_password_token)

    mail(to: user.email, subject: I18n.t('mailers.user_registration.subject'),
         template_path: 'devise/mailer', template_name: 'first_instructions')
  end
end
