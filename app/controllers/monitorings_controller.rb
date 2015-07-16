class MonitoringsController < ApplicationController
  before_action :set_event, except: :index
  before_action :set_item, only: [:approve, :destroy]

  def index
    @events = Event.order(:start_at)
  end

  def approved
    @items = @event.items.approved.page(params[:page]) if @event
  end

  def candidates
    @items = @event.items.listed.page(params[:page]) if @event
  end

  def approve
    @item.approved!
    @item.save!

    respond_with(@event, location: approved_monitoring_path(@event.hash_tag))
  end

  def destroy
    @item.removed!
    @item.save!

    respond_with(@event, location: approved_monitoring_path(@event.hash_tag))
  end

  private

  def set_event
    @event = Event.find_by_hash_tag params[:hash_tag]
  end

  def set_item
    @item = Item.find params[:item_id]
  end
end
