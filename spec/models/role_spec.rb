require 'rails_helper'

RSpec.describe Role, type: :model do
  context 'database associations' do
    it { is_expected.to have_many(:'users-backup') }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:key) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:name).with_options(null: false, limit: 20) }
    it { is_expected.to have_db_column(:description).with_options(limit: 255) }
    it { is_expected.to have_db_column(:key).with_options(null: false, limit: 10) }
  end
end
