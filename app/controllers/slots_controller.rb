class SlotsController < ApplicationController
  # before_action :find_employee

  def show
    @slot = Slot.find_by(id: params[:id])
  end

  def index
    @slots = Slot.by_status_and_datetime.page(params[:page])
                 .per Settings.paginate.slots_per_page
  end
end
