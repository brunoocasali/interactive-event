class Item < ActiveRecord::Base
  belongs_to :service
  belongs_to :event

  validates :event, presence: true
  validates :service, presence: true

  has_enumeration_for :status, with: ItemStatus, required: true
end
