class StoresController < ApplicationController
  def create
    @store = Store.new store_params
    if @store.save
      flash[:success] = t ".registered_success"
      redirect_to @store
    else
      render :new
    end
  end

  def new
    @store = Store.new
  end

  private

  def store_params
    params.require(:store).permit Store::STORE_PERMITTED_PARAMS
  end
end
