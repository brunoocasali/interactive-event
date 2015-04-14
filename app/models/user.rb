class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :timeoutable, :lockable

  belongs_to :role

  has_many :events

  validates :role,
            presence: true, associated: true
  validates :phone, :name, :email,
            presence: true

  before_save :assign_role

  def assign_role
    self.role = Role.find_by key: :common if self.role.nil?
  end

  def only_if_unconfirmed
    pending_any_confirmation {yield}
  end

  def password_match?
    self.errors[:password] << "can't be blank" if password.blank?
    self.errors[:password_confirmation] << "can't be blank" if password_confirmation.blank?
    self.errors[:password_confirmation] << "does not match password" if password != password_confirmation
    password == password_confirmation && !password.blank?
  end
end
