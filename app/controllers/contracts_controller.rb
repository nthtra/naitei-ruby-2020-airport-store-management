class ContractsController < ApplicationController
  before_action :find_employee

  def index
    @contracts = Contract.by_status_and_datetime.page(params[:page])
                         .per Settings.paginate.contracts_per_page
  end

  def show
    @contract = Contract.find_by id: params[:id]
  end

  def update
    @contract = Contract.find_by id: params[:id]
    if params[:status_id].to_i == Settings.status.approve
      show_flash_approve_contract
    elsif params[:status_id].to_i == Settings.status.deny
      show_flash_deny_contract
    end
    respond_to do |format|
      format.html{redirect_to @contract}
      format.js
    end
  end

  private

  def find_employee
    @employee = Employee.find_by id: session[:employee_id]
    return if @employee

    flash[:error] = t ".employee_not_found"
    redirect_to employees_login_path
  end

  def show_flash_approve_contract
    @result = ApproveContractService.new(@contract.id).perform
    case @result
    when :slot_is_full
      flash.now[:error] = t ".slot_is_full"
    when :update_database_false
      flash.now[:error] = t ".update_database_false"
    when :approve_successfully
      flash.now[:success] = t ".approve_successfully"
    end
  end

  def show_flash_deny_contract
    @result = DenyContractService.new(@contract.id, params[:message]).perform
    case @result
    when :update_database_false
      flash.now[:error] = t ".update_database_false"
    when :deny_successfully
      flash.now[:success] = t ".deny_successfully"
    end
  end
end
