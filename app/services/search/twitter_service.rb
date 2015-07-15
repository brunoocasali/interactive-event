module Search
  class TwitterService
    def self.find_tweets_for(event, client = $twitter_client)
      last = event.items.last.try(&:id)

      client.search("#{event.hash_tag} -rt", result_type: :recent).each_with_index do |tweet, i|
        break if tweet.id.to_s.eql?(last) || i.eql?(500)

        event.items << make_a_item_by(tweet)
      end
    end

    def self.make_a_item_by(tweet)
      Item.new(id: tweet.id,
               text: tweet.text,
               status: ItemStatus::LISTED,
               image_link: (tweet.media[0].media_url_https if tweet.media.present?),
               author: make_an_author_by(tweet.user),
               service: ServiceKind::TWITTER) if tweet
    end

    # TODO: Refactor this code, I guess there is Ruby's mother fucker methods! :P
    def self.make_an_author_by(user)
      author = Author.find_by(id: user.id, service: ServiceKind::TWITTER)

      unless author
        author = Author.create!(id: user.id,
                                profile_image_url: user.profile_image_url.to_s.sub('_normal', ''),
                                name: (user.name.nil? ? 'username!' : user.name),
                                screen_name: "@#{user.screen_name}",
                                profile_url: "https://twitter.com/#{user.screen_name}",
                                service: ServiceKind::TWITTER)
      end

      author
    end
  end
end
