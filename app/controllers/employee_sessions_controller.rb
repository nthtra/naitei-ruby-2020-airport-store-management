class EmployeeSessionsController < ApplicationController
  def new; end

  def create
    employee = Employee.find_by email: params[:employee_session][:email]
    if employee&.authenticate params[:employee_session][:password]
      store_employee employee
    else
      flash.now[:error] = t ".invalid_email_password_combination"
      render :new
    end
  end

  private

  def store_employee employee
    if employee.is_store_employee?
      flash[:success] = t ".logged_in_successfully"
      employee_log_in employee
      redirect_to employee
    else
      flash[:error] = t ".can_not_access"
      render :new
    end
  end
end
