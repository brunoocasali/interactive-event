require 'rails_helper'

RSpec.describe Event, type: :model do
  context 'database associations' do
    it { is_expected.to belong_to(:user) }

    it { is_expected.to have_and_belong_to_many(:services) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:user) }

    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_inclusion_of(:kind).in_array(EventKind.list) }

    it { is_expected.to validate_presence_of(:hash_tag) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:start_at) }
    it { is_expected.to validate_presence_of(:end_at) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:user_id).of_type(:integer)
                            .with_options(null: false) }

    it { is_expected.to have_db_column(:hash_tag).of_type(:string)
                            .with_options(limit: 30, null: false) }
    it { is_expected.to have_db_column(:title).of_type(:string)
                            .with_options(limit: 75, null: false) }

    it { is_expected.to have_db_column(:image).of_type(:string)
                            .with_options(limit: 225, null: false) }

    it { is_expected.to have_db_column(:start_at).of_type(:datetime)
                            .with_options(null: false) }
    it { is_expected.to have_db_column(:end_at).of_type(:datetime)
                            .with_options(null: false) }
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:kind) }
    it { is_expected.to have_db_index(:user_id) }
  end
end
