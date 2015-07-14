require 'rails_helper'

RSpec.describe DisplaysController, type: :controller do
  describe 'GET #show' do
    it 'returns http success' do
      event = create(:event)

      get :show, hash_tag: event.hash_tag

      expect(response).to have_http_status(:success)
    end
  end
end
