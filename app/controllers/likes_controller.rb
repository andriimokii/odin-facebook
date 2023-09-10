class LikesController < ApplicationController
  before_action :set_like, only: [:destroy]
  before_action :set_likeable

  def create
    @like = @likeable.likes.new(user: current_user)
    if @like.save
      redirect_to request.referrer, notice: 'Like created!'
    end
  end

  def destroy
    if @like.destroy
      redirect_to request.referrer, notice: 'Like destroyed!'
    end
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def set_likeable
    @likeable =
      if params[:post_id].present?
        Post.find(params[:post_id])
      else
        Comment.find(params[:comment_id])
      end
  end
end
