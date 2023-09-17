class Users::PostsController < ApplicationController
  before_action :set_user, only: :index

  def index
    @posts = @user.posts
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
