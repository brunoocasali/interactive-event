require 'rails_helper'

RSpec.describe SearchService, type: :service do
  let(:event) { create(:event) }

  context 'about class methods' do
    it 'need to respond' do
      expect(described_class).to respond_to(:search)
    end
  end

  describe '.search' do
    it 'receives an event by parameter' do
      allow(described_class).to receive(:search).with(event: event)
    end
  end
end
