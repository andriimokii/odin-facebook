class UsersController < ApplicationController
  before_action :set_user, except: %i[index create new]

  def index
    @users = User.where.not(id: current_user.id).order(:email)
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
