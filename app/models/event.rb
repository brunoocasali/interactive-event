class Event < ActiveRecord::Base
  belongs_to :user

  has_and_belongs_to_many :services

  validates :end_at, presence: true
  validates :hash_tag, presence: true
  validates :start_at, presence: true
  validates :title, presence: true
  validates :user, presence: true, associated: true

  has_enumeration_for :kind, with: EventKind, required: true
end
