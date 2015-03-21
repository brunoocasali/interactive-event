require 'rails_helper'

RSpec.describe Service, type: :model do
  context 'database associations' do
    it { is_expected.to have_many(:items) }
  end

  context 'model validations' do
    it { is_expected.to validate_presence_of(:name) }
  end

  context 'model attributes' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
  end
end
