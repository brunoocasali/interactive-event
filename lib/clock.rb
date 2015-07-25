require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

require File.expand_path('../../app/models/event.rb', __FILE__)
require File.expand_path('../../app/services/search/base.rb', __FILE__)

include Clockwork

every(2.minutes, '-------------------***---- RUN: Event Finder!') do
  ActiveRecord::Base.connection_pool.with_connection do
    Event.will_happen.each do |event|
      Search::Base.new(event).start_finder!
    end
  end
end
