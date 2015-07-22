require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'database associations' do
    it { is_expected.to have_many(:items) }

    it { is_expected.to belong_to(:user) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:user) }

    it { is_expected.to validate_presence_of(:hash_tag) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }

    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_inclusion_of(:kind).in_array(EventKind.list) }
  end

  context 'model attributes' do
    it do
      is_expected.to have_db_column(:user_id).of_type(:integer)
                         .with_options(null: false)
    end

    it do
      is_expected.to have_db_column(:hash_tag).of_type(:string)
                         .with_options(limit: 75, null: false)
    end
    it do
      is_expected.to have_db_column(:title).of_type(:string)
                         .with_options(limit: 75, null: false)
    end
    it do
      is_expected.to have_db_column(:cover).of_type(:string)
                         .with_options(limit: 255)
    end

    it do
      is_expected.to have_db_column(:start_at).of_type(:datetime)
                         .with_options(null: false)
    end
    it do
      is_expected.to have_db_column(:end_at).of_type(:datetime)
                         .with_options(null: false)
    end
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:kind) }
    it { is_expected.to have_db_index(:user_id) }
  end

  context 'scope methods' do
    describe '.will_happen' do
      it { expect(described_class).to respond_to(:will_happen) }

      it 'needs to return some objects' do
        event = create(:event, start_at: DateTime.now + 1)
        event2 = create(:event, start_at: DateTime.now - 2)

        expect(described_class.will_happen).to match_array([event, event2])
      end
    end

    describe '.current' do
      it { expect(described_class).to respond_to(:current) }

      it 'needs to return the current event' do
        event = create(:event, start_at: DateTime.now, end_at: DateTime.now + 2.days)
        create(:event, start_at: DateTime.now - 2.days)

        expect(described_class.current).to eq(event)
      end
    end
  end

  context 'instance methods' do
    describe '#tweets' do
      subject { create(:event, services: %w(ServiceKind::TWITTER)) }

      it { expect(subject).to respond_to(:tweets) }

      it 'only tweets objects' do
        tweet = create(:item, service: ServiceKind::TWITTER)
        # TODO: When add the new searcher methods uncomment this lines to
        # improve testability
        # post = create(:item, service: ServiceKind::FACEBOOK)

        subject.items << tweet # << post

        expect(subject.tweets).to match_array([tweet])
      end
    end
  end

  context 'hooks methods' do
    describe '#drop_hash_tag' do
      it 'needs to remove hash_tag from tag' do
        event = create(:event, hash_tag: '#trololo')

        expect(event.hash_tag).to eq('trololo')
      end
    end
  end

  context 'presenter methods' do
    describe '#tag' do
      it { expect(described_class.new).to respond_to(:tag) }

      it 'needs to show a string with complete hash_tag' do
        event = create(:event, hash_tag: '#trololo')

        expect(event.tag).to eq('#trololo')
      end
    end
  end
end
