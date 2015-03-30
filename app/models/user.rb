class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable, :timeoutable, :lockable

  has_many :events

  validates :email, presence: true
  validates :name, presence: true
  validates :phone, presence: true
end
