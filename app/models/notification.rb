class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  def acknowledge
    self.acknowledged = true
  end
end
