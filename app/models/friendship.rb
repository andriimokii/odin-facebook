# == Schema Information
#
# Table name: friendships
#
#  id         :bigint           not null, primary key
#  status     :string           default("pending")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  friend_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_friendships_on_friend_id  (friend_id)
#  index_friendships_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (friend_id => users.id)
#  fk_rails_...  (user_id => users.id)
#
class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: User.name

  enum status: {
    pending: PENDING = 'pending',
    accepted: ACCEPTED = 'accepted'
  }
end
