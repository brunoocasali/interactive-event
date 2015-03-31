class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :timeoutable, :lockable

  belongs_to :role

  has_many :events

  validates :role, presence: true, associated: true
  validates :email, presence: true
  validates :name, presence: true
  validates :phone, presence: true
end
