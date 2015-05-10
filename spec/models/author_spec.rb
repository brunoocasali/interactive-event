require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'database associations' do
    it { is_expected.to have_many(:items) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:service) }
    it { is_expected.to validate_inclusion_of(:service).in_array(ServiceKind.list) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:id).of_type(:integer).with_options(null: false) }

    it { is_expected.to have_db_column(:service).of_type(:integer)
                            .with_options(null: false) }

    it { is_expected.to have_db_column(:profile_image_url).of_type(:string) }
    it { is_expected.to have_db_column(:profile_url).of_type(:string) }
    it { is_expected.to have_db_column(:name).of_type(:string)
                            .with_options(limit: 50, null: false) }
    it { is_expected.to have_db_column(:screen_name).of_type(:string)
                            .with_options(limit: 40) }
  end

  context 'database indexes' do
    it { is_expected.to have_db_index([:id, :service]).unique(true) }
  end
end
