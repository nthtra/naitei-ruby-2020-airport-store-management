class EmployeesController < ApplicationController
  before_action :authenticate_employee!

  def index
    @employees = Employee.page(params[:page])
                         .per Settings.paginate.employees_per_page
  end

  def show
    @employee = Employee.find_by id: params[:id]
  end
end
