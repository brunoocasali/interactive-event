module Search
  class Base
    attr_accessor :event

    def initialize(event)
      @event = event

      start_finder
    end

    def start_finder
      @event.services.map(&:key).each { |key| send("find_with_#{key}!") }
    end

    def find_with_twitter!
      TwitterService.find_tweets_with(@event.hash_tag, $twitter_client)
    end
  end
end
