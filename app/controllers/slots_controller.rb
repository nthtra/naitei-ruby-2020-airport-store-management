class SlotsController < ApplicationController
  def show
    @slot = Slot.find_by id: params[:id]
    @store = Store.new
    @store.build_contract
  end

  def index
    @slots = Slot.by_status_and_datetime.page(params[:page])
                 .per Settings.paginate.slots_per_page
  end
end
