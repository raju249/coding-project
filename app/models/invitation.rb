class Invitation < ApplicationRecord
  belongs_to :event
  belongs_to :user

  enum status: { pending: 0, accepted: 1, declined: 2 }

  validates :event, presence: true
  validates :user, presence: true
  validates :status, presence: true
end
