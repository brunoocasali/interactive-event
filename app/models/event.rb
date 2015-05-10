class Event < ActiveRecord::Base
  has_many :items

  belongs_to :user

  validates :end_at, presence: true
  validates :hash_tag, presence: true
  validates :start_at, presence: true
  validates :title, presence: true
  validates :user, presence: true, associated: true

  after_validation :drop_hash_tag

  has_enumeration_for :kind, with: EventKind, required: true

  scope :will_happen, -> (date = DateTime.now) { where('start_at >= ?', date - 1) }

  def tweets
    items.twitter
  end

  def drop_hash_tag
    return false unless errors.empty?
    hash_tag.sub! '#', ''
  end

  def tag
    "##{hash_tag}"
  end
end
