class Item < ActiveRecord::Base
  self.primary_key = :id

  belongs_to :author
  belongs_to :event

  validates :event, presence: true, associated: true
  validates :author, presence: true, associated: true

  has_enumeration_for :status, with: ItemStatus, required: true,
                      create_scopes: true, create_helpers: true
  has_enumeration_for :service, with: ServiceKind, required: true, create_scopes: true

  paginates_per 50
end
