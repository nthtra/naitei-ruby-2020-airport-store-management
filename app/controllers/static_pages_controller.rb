class StaticPagesController < ApplicationController
  def home
    @slots = Slot.all.page(params[:page]).per Settings.pagination.per_page
    @terminals = Terminal.all
  end
end
