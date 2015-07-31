class UserRegistration < ApplicationMailer
  def first_instructions(user, token)
    @user = user
    @token = token

    mail(to: user.email, subject: I18n.t('mailers.user_registration.subject'),
         template_path: 'devise/mailer', template_name: 'first_instructions')
  end
end
