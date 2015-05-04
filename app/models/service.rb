class Service < ActiveRecord::Base
  has_many :items

  # TODO: Validates a presence of a key! in underscore form
  # TODO: create a before_save method to do this!! ^^
  validates :name, presence: true
  validates :key, presence: true
end
