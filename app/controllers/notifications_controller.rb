class NotificationsController < ApplicationController
  def index
    @notifications = Notification.user_receive_noti(current_employee.id)
                                 .noti_order_by_created_at_desc
    params[:click] = false
    render json: {html: render_to_string(partial: "list_noti",
      locals: {notifications: @notifications})}
  end

  def update
    @notification = Notification.find_by id: params[:id]
    @notification.update! read: true
    redirect_to contract_path(@notification.contract.id)
  end
end
