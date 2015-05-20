require 'rails_helper'

RSpec.describe DisplaysController, type: :controller do

  describe 'GET #show' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
