module EmployeeSessionsHelper
  def employee_log_in employee
    session[:employee_id] = employee.id
  end

  def current_employee
    return unless session[:employee_id]

    @current_employee ||= Employee.find_by id: session[:employee_id]
  end

  def employee_logged_in?
    current_employee.present?
  end

  def current_employee? employee
    employee == current_employee
  end

  def store_employee employee
    return if employee.unit_id == Settings.validations.employee.store_unit

    flash[:error] = t ".can_not_access"
    redirect_to employee_login_path
  end

  def employee_log_out
    session.delete :employee_id
    @current_employee = nil
  end
end
