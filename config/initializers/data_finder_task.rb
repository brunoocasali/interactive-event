require 'rufus-scheduler'

@scheduler ||= Rufus::Scheduler.new

@scheduler.every '2m' do
  Event.will_happen.each { |event| Search::Base.start_finder(event) }
end
