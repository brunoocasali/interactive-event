class Item < ActiveRecord::Base
  self.primary_key = :id

  belongs_to :author
  belongs_to :event

  validates :event, presence: true, associated: true
  validates :author, presence: true, associated: true

  mount_uploader :image, SlideImageUploader

  has_enumeration_for :status, with: ItemStatus, required: true, create_scopes: true,
                               create_helpers: true
  has_enumeration_for :service, with: ServiceKind, required: true, create_scopes: true,
                                create_helpers: { polymorphic: { suffix: '_spawn' } }

  scope :ordered, -> { order('created_at DESC') }
  scope :after, -> (id) { where.not(id: id).order('views ASC').limit(10) }

  def add_new_view!
    self.increment! :views, 1
  end
end
