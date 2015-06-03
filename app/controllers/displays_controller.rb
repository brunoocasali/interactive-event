class DisplaysController < ApplicationController
  skip_before_filter :authenticate_user!
  before_action :set_event, only: :show

  layout 'display'

  def show
    @item = @event.items.approved.sample
  end

  private

  def set_event
    @event = Event.find_by_hash_tag params[:hash_tag] if params[:hash_tag]
  end
end
