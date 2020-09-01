class StaticPagesController < ApplicationController
  def home
    @slots = Slot.all.by_status_and_datetime_for_user
                 .page(params[:page]).per Settings.pagination.per_page
  end
end
