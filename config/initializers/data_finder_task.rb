require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '20s' do
  Event.will_happen.each do |event|
    Search::Base.new(event).start_finder!
  end
end
