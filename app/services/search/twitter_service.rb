module Search
  class TwitterService
    # Isso é legal chamar dentro de um job
    def self.find_tweets_with(hash_tag)
      $twitter_client.search(hash_tag, result_type: :recent).take(10).each do |tweet|
        puts tweet.text
      end
    end
  end
end
