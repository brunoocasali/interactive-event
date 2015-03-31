class Role < ActiveRecord::Base
  has_many :users

  validates :name, :key, presence: true
end
