module FriendshipsHelper
  def friendship_form_facade(user)
    result = {}
    friendship = Friendship.where(user: current_user, friend: user).first

    if friendship.present?
      result[:url] = friendship_path(id: friendship.id)
      result[:method] = :delete
      result[:button_text] = friendship.accepted? ? 'Delete friendship' : 'Cancel friend request'
    else
      result[:url], result[:method], result[:button_text] = friendships_path, :post, 'Send friend request'
    end

    result
  end
end
