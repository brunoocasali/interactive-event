module Search
  class Base
    def initialize(event)
      @event = event

      start_finder
    end

    def start_finder
      @event.services.map(&:to_s).reject(&:empty?).map(&:to_i).each do |key|
        send("find_with_#{ ServiceKind.key_for(key) }!")
      end
    end

    def find_with_twitter!
      TwitterService.find_tweets_for(@event, $twitter_client)
    end
  end
end
