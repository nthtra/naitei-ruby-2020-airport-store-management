class StoresController < ApplicationController
  before_action :logged_in_user, :find_user_by_id

  def show
    @store = Store.find_by(id: params[:id])
  end

  def index
    @stores = @user.stores.order_by_updated_at_desc.page(params[:page])
                   .per Settings.pagination.per_page
  end

  def new
    @store = Store.new
    @store.build_contract
  end

  def create
    @store = Store.new store_params
    if @store.save
      flash[:success] = t ".registered_success"
      redirect_to stores_path @store.slot_id
      send_notice
    else
      flash[:error] = t ".register_failed"
      render :new
    end
  end

  def destroy
    @store = Store.find_by id: params[:id]
    @slot = @store.slot
    @store.destroy
    is_empty = true
    @slot.stores.each do |store|
      is_empty = false unless store.approved?
    end
    @slot.update is_empty: is_empty
    flash[:success] = t ".destroy_success"
    redirect_to stores_path
  end

  private

  def store_params
    data = params.require(:store).permit Store::STORE_PERMITTED_PARAMS
    data.merge! slot_id: params[:slot_id],
                category_id: params[:store][:category_id],
                user_id: session[:user_id]
  end

  def employee_manager
    Employee.employee_manager
  end

  def send_notice
    employee_manager.each do |manager|
      notification_quantity = Notification.user_receive_noti(manager.id, "Employee")
                                          .unread_noti
                                          .count
      Notification.create(sender_id: current_user.id, receiver_id: manager.id,
                          sender_type: "User", receiver_type: "Employee",
                          contract_id: @store.contract.id)
      ActionCable.server.broadcast "notification_channel",
                                   {to: "notification_manager_#{manager.id}",
                                    notification_quantity: notification_quantity + 1}
    end
  end
end
