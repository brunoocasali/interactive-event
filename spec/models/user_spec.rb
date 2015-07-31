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

    it do
      is_expected.to have_db_column(:email).of_type(:string)
        .with_options(limit: 50, null: false, unique: true)
    end
    it do
      is_expected.to have_db_column(:name).of_type(:string)
        .with_options(limit: 30)
    end
    it do
      is_expected.to have_db_column(:phone).of_type(:string)
        .with_options(limit: 15)
    end
  end

  context 'database indexes' do
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:role_id) }
  end

  context 'methods' do
    it 'a instance of user need to respond to methods' do
      user = create(:user)

      expect(user).to respond_to(:root?)
      expect(user).to respond_to(:common?)
      expect(user).to respond_to(:admin?)
      expect(user).to respond_to(:password_match?)
    end

    describe '#root?' do
      it 'needs to be a root' do
        user = create(:user, role: create(:role, name: 'Root'))

        expect(user.root?).to be_truthy
        expect(user.admin?).to be_falsey
      end
    end

    describe '#admin?' do
      it 'needs to be a admin' do
        user = create(:user, role: create(:role, name: 'Admin'))

        expect(user.admin?).to be_truthy
        expect(user.root?).to be_falsey
      end
    end

    describe '#common?' do
      it 'needs to be a common' do
        user = create(:user, role:  create(:role, name: 'Common'))

        expect(user.common?).to be_truthy
        expect(user.root?).to be_falsey
      end
    end
  end
end
