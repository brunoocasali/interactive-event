require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '2s' do
  # Event.will_happen.each do |event|
  #   Search::Base.new(event).start_finder!
  # end

  Rails.logger.info '----------------------------****---------------- WORKS'
end
