require 'rufus-scheduler'

@scheduler ||= Rufus::Scheduler.new

@scheduler.every '2m' do
  Event.will_happen.each { |event| Search::Base.new(event) }
end
