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
end
