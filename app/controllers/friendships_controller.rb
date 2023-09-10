class FriendshipsController < ApplicationController
  before_action :set_friend
  before_action :set_friendship, except: %i[index new create]

  def create
    @friendship = current_user.friendships.new(friend: @friend)
    if @friendship.save
      redirect_to request.referrer, notice: 'Friendship request submitted'
    else
      redirect_to request.referrer, alert: 'Friendship request failed to be submitted'
    end
  end

  def update
    if @friendship.update(friendship_params)
      redirect_to request.referrer, notice: 'Friendship request changed'
    else
      redirect_to request.referrer, alert: 'Request failed to be changed'
    end
  end

  def destroy
    if @friendship.destroy
      redirect_to request.referrer, notice: 'Request destroyed'
    else
      redirect_to request.referrer, notice: 'Request failed to be destroyed'
    end
  end

  private

  def friendship_params
    params.require(:friendship).permit(:friend_id, :status)
  end

  def set_friend
    @friend = User.find(params[:friend_id])
  end

  def set_friendship
    @friendship = Friendship.find(params[:id])
  end
end
