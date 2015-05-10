class MonitoringsController < ApplicationController
  before_action :set_event, only: [:approved, :candidates]

  def index
    @events = Event.order(:start_at)
  end

  def approved; end

  def candidates; end

  private

  def set_event
    @event = Event.find_by_hash_tag(params[:hash_tag])
    @items = @event.items
  end
end
