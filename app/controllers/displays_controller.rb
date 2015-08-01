class DisplaysController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_event, only: :show

  layout 'display'

  def show
    @item = if @event.items.approved.size == 1
              @event.items.approved.first
            else
              @event.items.approved.after(session[:last_seen_id]).first
            end

    if @item.present?
      @item.add_new_view!
      session[:last_seen_id] = @item.id
    end

    respond_with(@item)
  end

  private

  def set_event
    @event = Event.find_by_hash_tag params[:hash_tag] if params[:hash_tag]
  end
end
