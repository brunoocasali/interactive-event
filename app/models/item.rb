class Item < ActiveRecord::Base
  self.primary_key = :id

  belongs_to :event

  validates :event, presence: true, associated: true
  validates :service, presence: true, associated: true

  has_enumeration_for :status, with: ItemStatus, required: true
end
