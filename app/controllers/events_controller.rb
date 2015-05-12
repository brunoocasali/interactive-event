class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
    respond_with(@events)
  end

  def edit; end

  def show; end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def create
    @event = Event.new(event_params)
    @event.save
    respond_with(@event)
  end

  def update
    @event.update_attributes(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    remove_blank(params)

    params.require(:event).permit(:hash_tag, :title, :image, :start_at,
                                  :end_at, :kind, :user_id, services: [])
  end

  def remove_blank(params)
    params[:event][:services] ||= []
    params[:event][:services].reject!(&:empty?).collect!(&:to_i)
  end
end
