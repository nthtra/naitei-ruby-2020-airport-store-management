module ApplicationHelper
  def disable_layout?
    current_page?(signup_path) || current_page?(login_path) ||
      (controller.controller_name == "users" &&
        controller.action_name == "create") ||
      (controller.controller_name == "sessions" &&
        controller.action_name == "create")
  end
end
