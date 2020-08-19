module ApplicationHelper
  def disable_layout?
    current_page?(signup_path) || current_page?(login_path) ||
      (controller.controller_name == "users" &&
        controller.action_name == "create") ||
      (controller.controller_name == "sessions" &&
        controller.action_name == "create")
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
end
