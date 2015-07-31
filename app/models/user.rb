class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :timeoutable, :lockable

  belongs_to :role
  has_many :events

  validates :role, presence: true, associated: true

  validates :name,presence: true
  validates :email, presence: true
  validates :phone, presence: true

  before_save :assign_role

  before_create :turn_new_user
  after_create :send_admin_mail

  scope :allowed, -> { where.not(role_id: [Role.find_by_key(:root)]) }

  def assign_role
    self.role = Role.find_by key: :common if role.nil?
  end

  def turn_new_user
    @raw, enc = Devise.token_generator.generate(User, :reset_password_token)
    self.reset_password_sent_at = Time.now
    self.reset_password_token = enc
  end

  def send_admin_mail
    UserRegistration.first_instructions(self, @raw).deliver_now if Rails.env.production?
  end

  def admin?
    role.name == 'Admin'
  end

  def root?
    role.name == 'Root'
  end

  def common?
    role.name == 'Common'
  end

  def confirmation_required?
    false
  end

  def password_match?
    errors[:password] << "can't be blank" if password.blank?
    errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    errors[:password_confirmation] << 'does not match password' if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
end
