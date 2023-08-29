class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: User.name

  enum status: {
    pending: PENDING = 'pending',
    accepted: ACCEPTED = 'accepted'
  }
end
