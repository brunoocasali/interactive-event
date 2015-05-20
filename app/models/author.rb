class Author < ActiveRecord::Base
  self.primary_key = :id

  has_many :items

  validates :name, presence: true

  has_enumeration_for :service, with: ServiceKind, required: true
end
