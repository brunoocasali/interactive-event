class Event < ActiveRecord::Base
  belongs_to :user
  has_many :items

  validates :end_at, presence: true
  validates :hash_tag, presence: true
  validates :start_at, presence: true
  validates :title, presence: true
  validates :user, presence: true, associated: true

  after_validation :drop_hash_tag

  has_enumeration_for :kind, with: EventKind, create_helpers: true, required: true

  scope :will_happen, -> (date = DateTime.now) { where('start_at >= ?', date - 1) }

  def tweets
    items.twitter
  end

  def tag
    "##{hash_tag}"
  end

  private

  def drop_hash_tag
    return false unless errors.empty?
    hash_tag.sub! '#', ''
  end
end
