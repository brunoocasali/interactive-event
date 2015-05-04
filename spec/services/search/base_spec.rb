require 'rails_helper'

RSpec.describe Search::Base, type: :service do
  subject { described_class }

  context 'about class methods' do
    it 'need to respond' do
      expect(subject).to respond_to(:start_finder)
    end
  end

  describe '.start_finder' do
    it 'receives an event by parameter' do
      event = create :event

      expect(subject).to receive(:start_finder).with(event: event)

      subject.start_finder(event: event)
    end

    it 'calls the starter of twitter service' do
      event = create(:event, services: [ create(:service, key: :twitter) ])

      expect(subject).to receive(:find_with_twitter!).with(event: event)

      subject.start_finder(event: event)
    end
  end

  describe '.find_with_twitter!' do
    it 'needs to call specific class' do
      event = create(:event, services: [ create(:service, key: :twitter) ])

      expect(Search::TwitterService).to receive(:find_tweets_with).with(event.hash_tag)

      subject.start_finder(event: event)
    end
  end
end
