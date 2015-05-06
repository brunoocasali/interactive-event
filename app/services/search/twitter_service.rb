module Search
  class TwitterService
    def self.find_tweets_with(event, client = $twitter_client)
      last_id = event.items.last ? event.items.last.id : 1

      ActiveRecord::Base.transaction do
        client.search(event.hash_tag, result_type: :recent).each_with_index do |tweet, i|
          event.items << make_a_item_by(tweet)

          break if tweet.id.to_s == last_id or i > 500
        end

        event.save!
      end
    end

    private

    def self.make_a_item_by(tweet)
      Item.new id: tweet.id,
               text: tweet.text,
               status: ItemStatus::LISTED,
               service: Search::TWITTER
    end
  end
end
