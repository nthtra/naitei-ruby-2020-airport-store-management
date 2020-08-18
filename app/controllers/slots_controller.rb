class SlotsController < ApplicationController
  def show
    @slot = Slot.find_by(id: params[:id])
  end

  def index
    @slots = Slot.page(params[:page]).per Settings.pagination.per_page
  end
end
