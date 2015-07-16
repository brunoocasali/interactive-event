require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(2.minutes, 'Finding new events') do
  Event.will_happen.each do |event|
    Delayed::Job.enqueue Search::Base.new(event).start_finder!
  end
end
