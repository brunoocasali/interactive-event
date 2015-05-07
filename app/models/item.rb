class Item < ActiveRecord::Base
  self.primary_key = :id

  belongs_to :event

  validates :event, presence: true, associated: true

  has_enumeration_for :status, with: ItemStatus, required: true
  has_enumeration_for :service, with: ServiceKind, required: true, create_scopes: true
end
