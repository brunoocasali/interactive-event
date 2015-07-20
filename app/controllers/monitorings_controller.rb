class MonitoringsController < ApplicationController
  before_action :set_event, except: :index
  before_action :set_item, only: [:approve, :destroy]

  def index
    @events = Event.order(:start_at)
  end

  def approved
    @items = @event.items.approved.order(:created_at).page(params[:page]) if @event
  end

  def candidates
    @items = @event.items.listed.order(:created_at).page(params[:page]) if @event
  end

  def approve
    @item.update_attributes(status: ItemStatus::APPROVED)

    respond_with(@event, location: candidates_monitoring_path(@event.hash_tag),
                         notice: t('views.monitorings.actions.approve.approved', spawn: @item.service_spawn.to_s))
  end

  def destroy
    @item.update_attributes(status: ItemStatus::REMOVED)

    respond_with(@event, location: approved_monitoring_path(@event.hash_tag),
                         notice: t('views.monitorings.actions.remove.removed', spawn: @item.service_spawn.to_s))
  end

  private

  def set_event
    @event = Event.find_by_hash_tag params[:hash_tag]
  end

  def set_item
    @item = Item.find params[:item_id]
  end
end
