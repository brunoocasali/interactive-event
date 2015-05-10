require 'rails_helper'

RSpec.describe MonitoringsController, type: :controller do
  render_views

  let(:valid_attributes) do
    attributes_for :event, hash_tag: '#trololo', user_id: @current_user.id
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index

      expect(response).to have_http_status(:success)
    end

    it 'assigns all events as @events' do
      event = create :event, valid_attributes

      get :index

      expect(assigns(:events)).to include(event)
    end
  end

  context 'maintaining actions' do
    let(:event) { create :event, valid_attributes }

    describe 'GET #approved' do
      before { get :approved, hash_tag: event.hash_tag }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns a event as @event' do
        expect(assigns(:event)).to eq(event)
      end
    end

    describe 'GET #candidate' do
      before { get :candidates, hash_tag: event.hash_tag }

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns a event as @event' do
        expect(assigns(:event)).to eq(event)
      end
    end
  end
end
