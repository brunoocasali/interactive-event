require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

# TODO mudar p/ 2m
scheduler.every '2m' do
  Event.will_happen.each { |event| Search::Base.new(event).start_finder! }
end
