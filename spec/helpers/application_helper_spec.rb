require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do

  context 'methods' do
    it 'have the date_form_helper method?' do
      expect(helper).to respond_to(:date_form_helper)
    end

    it 'have the current_user_id method?' do
      expect(helper).to respond_to(:current_user_id)
    end
  end

  describe '.date_form_helper' do
    it 'returns a hash' do
      expect(helper.date_form_helper).to eq({ as: :string, input_html: { class: :datepicker } })
    end
  end

  describe '.current_user_id' do
    # context 'when is authenticated' do
    #   it 'needs to return the user id' do
    #     expect(helper.current_user_id).to eq(@current_user.id)
    #   end
    # end

    context 'when is unauthenticated' do
      it 'needs to return nothing' do
        expect(helper.current_user_id).to be_nil
      end
    end
  end
end
