require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(2.minutes, '-------------------***---- RUN: Event Finder!') do
  Event.will_happen.each do |event|
    Search::Base.new(event).start_finder!
  end
end
