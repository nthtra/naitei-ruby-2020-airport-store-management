class EmployeesController < ApplicationController
  before_action :authenticate_employee!

  def show
    @employee = Employee.find_by id: params[:id]
  end
end
