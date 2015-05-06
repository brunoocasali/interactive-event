class Event < ActiveRecord::Base
  has_many :items

  belongs_to :user

  has_and_belongs_to_many :services

  # TODO: Validates a presence of a hash_tag! with a " # " character.
  # TODO: create a before_save method to do this!! ^^

  validates :end_at, presence: true
  validates :hash_tag, presence: true
  validates :start_at, presence: true
  validates :title, presence: true
  validates :user, presence: true, associated: true

  has_enumeration_for :kind, with: EventKind, required: true

  # after_create { Search::Base::start_finder(self) }

  scope :will_happen, -> (date = DateTime.now) { where('start_at >= ?', date - 1) }

  def tweets
    items.where(service: Search::TWITTER)
  end
end
