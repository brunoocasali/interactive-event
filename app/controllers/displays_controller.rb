class DisplaysController < ApplicationController
  before_action :set_event, only: :show

  def show; end

  private

  def set_event
    @event = Event.find_by_hash_tag params[:hash_tag] if params[:hash_tag]
  end
end
