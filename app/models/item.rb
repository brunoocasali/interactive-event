class Item < ActiveRecord::Base
  belongs_to :event
  belongs_to :service

  validates :event, presence: true, associated: true
  validates :service, presence: true, associated: true

  has_enumeration_for :status, with: ItemStatus, required: true
end
