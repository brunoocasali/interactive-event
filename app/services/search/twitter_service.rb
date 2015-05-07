module Search
  class TwitterService
    def self.find_tweets_for(event, client = $twitter_client)
      last = event.items.last.try(&:id)

      client.search(event.hash_tag, result_type: :recent).each_with_index do |tweet, i|
        event.items << make_a_item_by(tweet)

        break if tweet.id.to_s == last || i > 500
      end
    end

    def self.make_a_item_by(tweet)
      Item.new(id: tweet.id,
               text: tweet.text,
               status: ItemStatus::LISTED,
               service: ServiceKind::TWITTER) if tweet
    end
  end
end
