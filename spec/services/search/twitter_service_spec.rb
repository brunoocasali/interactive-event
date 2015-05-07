require 'rails_helper'

RSpec.describe Search::TwitterService, type: :service do
  subject { Search::TwitterService }

  context 'class methods' do
    it { is_expected.to respond_to(:make_a_item_by) }
    it { is_expected.to respond_to(:find_tweets_for) }
  end

  describe '.find_tweets_for' do
    it 'needs to return the crawled items from web' do
      event = create :event, hash_tag: '#just_testing_the_web_crawler_with_this_ridiculous_hashtag',
                     services: [ ServiceKind::TWITTER ]

      subject.find_tweets_for(event)

      expect(event.items.count).to eq(1)
    end
  end

  describe '.make_a_item_by' do
    let(:tweet) { Twitter::Tweet.new(id: '596008529309278208', text: 'a text tweet') }
    let(:invalid_tweet) { nil }

    context 'when tweet is valid' do
      it 'create a new valid Item' do
        last = subject.make_a_item_by(tweet)

        expect(tweet).to be_a(Twitter::Tweet)
        expect(last).to be_a(Item)
        expect(last).to_not be_nil
        expect(last.id).to eq(tweet.id)
        expect(last.text).to eq(tweet.text)
        expect(last.status).to eq(ItemStatus::LISTED)
        expect(last.service).to eq(ServiceKind::TWITTER)
      end
    end

    context 'when tweet is invalid' do
      it 'does not create a Item' do
        last = subject.make_a_item_by(invalid_tweet)

        expect(last).to be_nil
      end
    end
  end
end
