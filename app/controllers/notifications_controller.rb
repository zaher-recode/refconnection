class NotificationsController < ApplicationController

    before_action :authenticate_user!
    def index
        @notifications = Notification.where(recipient: current_user).unread
    end

    def mark_read
        @notifications = Notification.where(recipient: current_user).unread
        @notifications.update_all(read_at: Time.zone.now)
        render json: {success: true}
    end

    def read
        @notification = Notification.find(params[:id])
        @notification.update(read_at: Time.zone.now)
        render json: {success: true}
    end
end