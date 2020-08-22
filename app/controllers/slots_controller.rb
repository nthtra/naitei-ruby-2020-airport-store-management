class SlotsController < ApplicationController
  def show
    @slot = Slot.find_by(id: params[:id])
  end

end
