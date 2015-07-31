class UserRegistration < ApplicationMailer
  def first_instructions(user)
    @user = user
    @token, saved = Devise.token_generator.generate(User, :reset_password_token)
    @user.reset_password_token = saved
    @user.reset_password_sent_at = Time.now
    @user.save!

    mail(to: user.email, subject: I18n.t('mailers.user_registration.subject'),
         template_path: 'devise/mailer', template_name: 'first_instructions')
  end
end
