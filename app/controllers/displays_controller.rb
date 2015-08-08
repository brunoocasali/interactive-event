class DisplaysController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_event, only: :show

  layout 'display'

  def show
    session[:send_your_content] ||= DateTime.now

    @item = if @event.items.approved.size == 1
              @event.items.approved.first
            else
              @event.items.approved.after(session[:last_seen_id]).first
            end

    if @item.present?
      @item.add_new_view!
      session[:last_seen_id] = @item.id
    end

    if 2.minutes.ago > session[:send_your_content].to_datetime
      session[:send_your_content] = DateTime.now
      @item = nil
    end

    respond_with(@item)
  end

  private

  def set_event
    @event = Event.find_by_hash_tag params[:hash_tag] if params[:hash_tag]
  end
end
