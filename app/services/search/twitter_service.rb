# module Search
#   class TwitterService
#     # Isso é legal chamar dentro de um job
#     def self.find_tweets_with(hash_tag)
#       $twitter_client.search(hash_tag, result_type: :recent).take(5).each do |tweet|
#         puts tweet.text
#       end
#     end
#   end
# end
#


module Search
  class TwitterService
    # Isso é legal chamar dentro de um job
    def self.find_tweets_with(hash_tag)
      # list = $twitter_client.search(hash_tag, result_type: :recent).take(500)
      #
      # loop do
      #   puts " --some \n"
      #   break if true
      # end

      $twitter_client.search(hash_tag, result_type: :recent).each do |tweet|
        puts tweet.text
        break if tweet.id.to_s == '595337603660021760'
      end
    end
  end
end
