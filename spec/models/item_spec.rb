require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'database associations' do
    it { is_expected.to belong_to(:service) }
    it { is_expected.to belong_to(:event) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:service) }
    it { is_expected.to validate_presence_of(:event) }

    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_array(ItemStatus.list) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:event_id).of_type(:integer) }
    it { is_expected.to have_db_column(:service_id).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }

    it { is_expected.to have_db_column(:text).of_type(:text) }
    it { is_expected.to have_db_column(:image_link).of_type(:string)
                            .with_options(limit: 340) }
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:status) }
    it { is_expected.to have_db_index(:event_id) }
    it { is_expected.to have_db_index(:service_id) }
  end
end
