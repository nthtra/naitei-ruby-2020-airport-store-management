class TerminalsController < ApplicationController
  def show
    @terminal = Terminal.find_by id: params[:id]
    @slots = @terminal.slots.by_status_and_datetime_for_user
                      .page(params[:page]).per Settings.pagination.per_page
  end
end
