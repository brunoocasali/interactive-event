require 'rails_helper'

RSpec.describe User, type: :model do
  context 'database associations' do
    it { is_expected.to have_many(:events) }

    it { is_expected.to belong_to(:role) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:role_id).of_type(:integer) }

    it { is_expected.to have_db_column(:email).of_type(:string)
                            .with_options(limit: 50, null: false, unique: true) }
    it { is_expected.to have_db_column(:name).of_type(:string)
                            .with_options(limit: 30) }
    it { is_expected.to have_db_column(:phone).of_type(:string)
                            .with_options(limit: 15) }
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:role_id) }
  end
end
