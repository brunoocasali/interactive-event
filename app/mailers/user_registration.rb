class UserRegistration < ApplicationMailer
  def first_instructions(user)
    @user = user
    @token = Devise.token_generator.generate(User, :reset_password_token)
    @user.reset_password_token = @token.last
    @user.reset_password_sent_at = Time.now
    @user.save!

    Rails.logger.info '------------------ '
    Rails.logger.info "@user.email #=> #{@user.email}"
    Rails.logger.info "@user.unconfirmed_email #=> #{@user.unconfirmed_email}"
    Rails.logger.info '------------------ '

    mail(to: user.unconfirmed_email, subject: I18n.t('mailers.user_registration.subject'),
         template_path: 'devise/mailer', template_name: 'first_instructions')
  end
end
