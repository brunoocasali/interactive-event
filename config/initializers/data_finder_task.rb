require 'rufus-scheduler'

scheduler = Rufus::Scheduler.singleton

scheduler.every '2m' do
  Event.will_happen.each { |event| Search::Base.new(event) }
end
