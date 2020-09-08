module ApplicationHelper
  def disable_layout?
    current_page?(signup_path) || current_page?(login_path) ||
      controller.controller_name.eql?("users") &&
        controller.action_name.eql?("create") ||
      controller.controller_name.eql?("sessions") &&
        controller.action_name.eql?("create") ||
      employee_layout?
  end

  def employee_layout?
    current_page?(new_employee_session_path) ||
      controller.controller_name.eql?("sessions") &&
        controller.action_name.eql?("new")
  end

  def toastr_flash
    flash_script =
      flash.each_with_object([]) do |(type, message), flash_messages|
        type = "success" if type.eql? "notice"
        type = "error" if type.eql? "alert"
        text = "toastr.#{type}('#{message}');"
        flash_messages << text if message
      end
    javascript_tag flash_script.join("\n")
  end

  def unread_noti_quantity
    Notification.user_receive_noti(current_employee.id).unread_noti.count
  end

  def unread_noti
    Notification.user_receive_noti(current_employee.id)
                .unread_noti.noti_order_by_created_at_desc
  end

  def time_ago time
    time_ago_in_words(time)
  end
end
