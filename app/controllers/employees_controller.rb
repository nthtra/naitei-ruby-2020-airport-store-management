class EmployeesController < ApplicationController
  before_action :logged_in_employee, :find_employee, :correct_employee

  def show
    @employee = Employee.find_by id: params[:id]
  end

  private

  def correct_employee
    return if current_employee? @employee

    flash[:error] = t ".can_not_access"
    redirect_to root_path
  end
end
