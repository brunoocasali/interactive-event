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

    describe '#password_match?' do
      context 'when a password is matched perfectly' do
        it 'needs to be return no errors' do
          user = create(:user, password: 'abcd1234', password_confirmation: 'abcd1234')

          expect(user.password_match?).to be_truthy
          expect(user.errors[:password]).to be_empty
        end
      end

      context 'when a passwords is blank' do
        it 'needs to be return a blank pwd error' do
          user = create(:user, password: '', password_confirmation: '')

          expect(user.password_match?).to be_falsey
          expect(user.errors[:password]).to eq(["can't be blank"])
          expect(user.errors[:password_confirmation]).to eq(["can't be blank"])
        end
      end

      context 'when a passwords is different' do
        it 'needs to be return a does not match error' do
          user = create(:user, password: 'my awesome pwd', password_confirmation: 'confirmation')

          expect(user.password_match?).to be_falsey
          expect(user.errors[:password_confirmation]).to eq(['does not match password'])
        end
      end
    end
  end
end
