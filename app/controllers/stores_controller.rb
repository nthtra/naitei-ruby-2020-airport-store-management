class StoresController < ApplicationController
  before_action :logged_in_user, :find_user_by_id

  def show
    @store = Store.find_by(id: params[:id])
  end

  def index
    @stores = @user.stores.order_by_created_at_asc.page(params[:page])
                   .per Settings.pagination.per_page
  end
end
