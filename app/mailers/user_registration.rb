class UserRegistration < ApplicationMailer
  def first_instructions(user)
    @user = user
    @user.lock_access!(send_instructions: false)
    mail(to: user.unconfirmed_email, subject: I18n.t('mailers.user_registration.subject'),
         template_path: 'devise/mailer', template_name: 'first_instructions')
  end
end
