# require File.expand_path('../../config/boot',        __FILE__)
# require File.expand_path('../../config/environment', __FILE__)
# require 'clockwork'
#
# include Clockwork
#
# every(2.minutes, 'Running Event Finder.') do
#   Event.will_happen.each do |event|
#     Search::Base.new(event).start_finder!
#   end
# end

require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

require File.expand_path('../../app/models/event', __FILE__)
require File.expand_path('../../app/services/search/base', __FILE__)

include Clockwork

every(2.minutes, 'Running Event Finder.') do
  Event.will_happen.each do |event|
    Search::Base.new(event).start_finder!
  end
end
