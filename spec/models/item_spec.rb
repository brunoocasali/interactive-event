require 'rails_helper'

RSpec.describe Item, type: :model do
  context 'database associations' do
    it { is_expected.to belong_to(:author) }
    it { is_expected.to belong_to(:event) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:author) }
    it { is_expected.to validate_presence_of(:event) }

    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_inclusion_of(:status).in_array(ItemStatus.list) }

    it { is_expected.to validate_presence_of(:service) }
    it { is_expected.to validate_inclusion_of(:service).in_array(ServiceKind.list) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:author_id).of_type(:integer) }
    it { is_expected.to have_db_column(:event_id).of_type(:integer) }
    it { is_expected.to have_db_column(:service).of_type(:integer) }
    it { is_expected.to have_db_column(:status).of_type(:integer) }

    it { is_expected.to have_db_column(:text).of_type(:text) }

    it do
      is_expected.to have_db_column(:image_link).of_type(:string)
        .with_options(limit: 340)
    end
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:author_id) }
    it { is_expected.to have_db_index(:event_id) }
    it { is_expected.to have_db_index(:service) }
    it { is_expected.to have_db_index(:status) }
  end
end
