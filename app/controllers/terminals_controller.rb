class TerminalsController < ApplicationController
  def show
    @terminal = Terminal.find_by(id: params[:id])
    @slots = @terminal.slots.page(params[:page])
                       .per Settings.pagination.per_page
  end
end
