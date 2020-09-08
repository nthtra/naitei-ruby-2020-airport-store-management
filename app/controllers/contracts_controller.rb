class ContractsController < ApplicationController
  before_action :authenticate_employee!
  load_and_authorize_resource

  def index
    @q = Contract.ransack params[:q]
    @contracts = @q.result.by_status_and_datetime.page(params[:page])
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
    format_response
    send_noti
  end

  private

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

  def send_noti
    notification_quantity = Notification.user_receive_noti(@contract.store.user.id, "User").unread_noti.count
    Notification.create(sender_id: current_employee.id, receiver_id: @contract.store.user.id,
                 sender_type: "Employee", receiver_type: "User", contract_id: @contract.id)
    ActionCable.server.broadcast "notification_channel", {to: "notification_user_#{@contract.store.user.id}",
                                                          notification_quantity: notification_quantity + 1}
  end

  def format_response
    respond_to do |format|
      format.html{redirect_to @contract}
      format.js
    end
  end
end
