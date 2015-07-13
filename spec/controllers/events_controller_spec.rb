require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  let(:valid_attributes) { attributes_for :event, user_id: @current_user.id }
  let(:invalid_attributes) { attributes_for :invalid_event }

  describe 'GET #index' do
    it 'assigns all events as @events' do
      event = create :event, valid_attributes

      get :index

      expect(assigns(:events)).to include(event)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested event as @event' do
      event = create :event, valid_attributes

      get :show, id: event.to_param

      expect(assigns(:event)).to eq(event)
    end
  end

  describe 'GET #new' do
    it 'assigns a new event as @event' do
      get :new

      expect(assigns(:event)).to be_a_new(Event)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested event as @event' do
      event = create :event, valid_attributes

      get :edit, id: event.to_param

      expect(assigns(:event)).to eq(event)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Event' do
        expect do
          post :create, event: valid_attributes
        end.to change(Event, :count).by(1)
      end

      it 'assigns a newly created event as @event' do
        post :create, event: valid_attributes

        expect(assigns(:event)).to be_a(Event)
        expect(assigns(:event)).to be_persisted
      end

      it 'redirects to the created event' do
        post :create, event: valid_attributes

        expect(response).to redirect_to(Event.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved event as @event' do
        post :create, event: invalid_attributes

        expect(assigns(:event)).to be_a_new(Event)
      end

      it "re-renders the 'new' template" do
        post :create, event: invalid_attributes

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { attributes_for :event }

      it 'updates the requested event' do
        event = create :event, valid_attributes

        put :update, id: event.to_param, event: new_attributes
        event.reload

        expect(event.tag).to eq(new_attributes[:hash_tag])
        expect(event.title).to eq(new_attributes[:title])
        expect(event.image).to eq(new_attributes[:image])
        expect(event.start_at.to_date).to eql(new_attributes[:start_at])
        expect(event.end_at.to_date).to eql(new_attributes[:end_at])
        expect(event.kind).to eq(new_attributes[:kind])
      end

      it 'assigns the requested event as @event' do
        event = create :event, valid_attributes

        put :update, id: event.to_param, event: valid_attributes

        expect(assigns(:event)).to eq(event)
      end

      it 'redirects to the event' do
        event = create :event, valid_attributes

        put :update, id: event.to_param, event: valid_attributes

        expect(response).to redirect_to(event)
      end
    end

    context 'with invalid params' do
      it 'assigns the event as @event' do
        event = create :event, valid_attributes

        put :update, id: event.to_param, event: invalid_attributes

        expect(assigns(:event)).to eq(event)
      end

      it "re-renders the 'edit' template" do
        event = create :event, valid_attributes

        put :update, id: event.to_param, event: invalid_attributes

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested event' do
      event = create :event, valid_attributes

      expect do
        delete :destroy, id: event.to_param
      end.to change(Event, :count).by(-1)
    end

    it 'redirects to the events list' do
      event = create :event, valid_attributes

      delete :destroy, id: event.to_param

      expect(response).to redirect_to(events_url)
    end
  end
end
