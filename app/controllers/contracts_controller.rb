class ContractsController < ApplicationController
  before_action :find_employee

  def index
    @contracts = Contract.by_status_and_datetime.page(params[:page])
                         .per Settings.paginate.contracts_per_page
  end

  def show
    @contract = Contract.find_by id: params[:id]
  end

  private

  def find_employee
    @employee = Employee.find_by id: session[:employee_id]
    return if @employee

    flash[:error] = t ".employee_not_found"
    redirect_to employees_login_path
  end
end
