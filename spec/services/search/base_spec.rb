require 'rails_helper'

RSpec.describe Search::Base, type: :service do
  context 'about class methods' do
    subject { described_class.new(create(:event)) }

    it 'need to respond' do
      is_expected.to respond_to(:start_finder)
    end
  end

  describe '.start_finder' do
    it 'receives an event by parameter' do
      base = described_class.new(create(:event))

      allow(base).to receive(:start_finder).with(no_args)
    end

    it 'calls the starter of twitter service' do
      base = described_class.new(create(:event, services: [ create(:service, key: :twitter) ]))

      allow(base).to receive(:find_with_twitter!).with(no_args)
    end
  end

  describe '.find_with_twitter!' do
    it 'needs to call specific class' do
      event = create(:event, services: [ create(:service, key: :twitter) ])

      expect(Search::TwitterService).to receive(:find_tweets_with).with(event.hash_tag, $twitter_client)

      described_class.new(event)
    end
  end
end