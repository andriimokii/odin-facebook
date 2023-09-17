class NotificationsController < ApplicationController
  before_action :set_notification, except: %i[index create new]

  def index
    @notifications = current_user.notifications.order(created_at: :desc)
  end

  def update
    if @notification.update(notification_params)
      redirect_to request.referrer, notice: 'Notification acknowledged'
    else
      redirect_to request.referrer, notice: 'Notification not acknowledged'
    end
  end

  def destroy
    if @notification.destroy
      redirect_to request.referrer, notice: 'Notification destroyed'
    else
      redirect_to request.referrer, notice: 'Notification not destroyed'
    end
  end

  private

  def notification_params
    params.require(:notification).permit(:acknowledged)
  end

  def set_notification
    @notification = Notification.find(params[:id])
  end
end
