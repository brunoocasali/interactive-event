# require 'rufus-scheduler'
#
# scheduler = Rufus::Scheduler.singleton
#
# scheduler.every '2m' do
#   Rails.logger.info "--------------------------*****-------- #{Time.now}"
#
#   Event.will_happen.each do |event|
#     Search::Base.new(event).start_finder!
#   end
# end
