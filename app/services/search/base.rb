module Search
  class Base
    def initialize(event)
      @event = event
    end

    def start_finder!
      @event.services.map(&:to_i).each do |key|
        Rails.logger.info "[#{Time.new.to_s(:long)}] ----- STARTED SOCIAL FINDER FOR: #{ServiceKind.key_for(key)} -----"

        send("find_with_#{ServiceKind.key_for(key)}!")

        Rails.logger.info "[#{Time.new.to_s(:long)}] ----- FINISHED SOCIAL FINDER: #{ServiceKind.key_for(key)} -----"
      end
    end

    def find_with_twitter!
      TwitterService.find_tweets_for(@event, $twitter_client)
    end
  end
end
