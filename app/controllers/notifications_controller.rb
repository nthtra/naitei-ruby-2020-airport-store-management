class NotificationsController < ApplicationController
  def index
    if logged_in?
      role = "User"
      @notifications = Notification.user_receive_noti(current_user.id, role).noti_order_by_created_at_desc
    elsif employee_signed_in?
      role = "Employee"
      @notifications = Notification.user_receive_noti(current_employee.id, role).noti_order_by_created_at_desc
    end
    params[:click] = false
    render json: {html: render_to_string(partial: "list_noti", locals: {notifications: @notifications})}
  end

  def update
    @notification = Notification.find_by id: params[:id]
    @notification.update! read: true
    if employee_signed_in?
      redirect_to contract_path(@notification.contract.id)
    elsif logged_in?
      redirect_to slot_store_path(@notification.contract.store.slot.id, @notification.contract.store.id)
    end
  end
end
