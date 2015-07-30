class UserRegistration < ActionMailer::Base
  default from: 'no-reply@telao.com.br'

  def first_instructions(user)
    @user = user
    @user.lock_access!(send_instructions: false)
    mail(to: user.email, subject: I18n.t('mailers.user_registration.subject'),
         template_name: 'devise/mailer/first_instructions')
  end
end
