require 'rails_helper'

RSpec.describe Search, type: :service do
  context 'constant objects' do
    subject { described_class }

    it 'need to respond' do
      twitter = Service.find_by_key(:twitter)

      expect(subject::TWITTER).to eq(twitter)
    end
  end
end
