require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let!(:event) { create(:event) }
  let!(:service) { create(:service) }
  let(:valid_attributes) { attributes_for :item, event_id: event.id, service_id: service.id }
  let(:invalid_attributes) { attributes_for :invalid_item }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all items as @items' do
      item = create :item, valid_attributes

      get :index

      expect(assigns(:items)).to include(item)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested item as @item' do
      item = create :item, valid_attributes

      get :show, { id: item.to_param }

      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'GET #new' do
    it 'assigns a new item as @item' do
      get :new

      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested item as @item' do
      item = create :item, valid_attributes

      get :edit, { id: item.to_param }

      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Item' do
        expect {
          post :create, { item: valid_attributes }
        }.to change(Item, :count).by(1)
      end

      it 'assigns a newly created item as @item' do
        post :create, { item: valid_attributes }

        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it 'redirects to the created item' do
        post :create, { item: valid_attributes }

        expect(response).to redirect_to(Item.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved item as @item' do
        post :create, { item: invalid_attributes }

        expect(assigns(:item)).to be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        post :create, { item: invalid_attributes }

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    describe 'with valid params' do
      let(:new_attributes) { attributes_for :item }

      it 'updates the requested item' do
        item = create :item, valid_attributes

        put :update, { id: item.to_param, item: new_attributes  }
        item.reload

        expect(item.status).to eq(new_attributes[:status])
        expect(item.text).to eq(new_attributes[:text])
        expect(item.image_link).to eq(new_attributes[:image_link])
        #expect(item.service.id).to eq(new_attributes[:service][:id])
        #expect(item.event.id).to eq(new_attributes[:event][:id])
      end

      it 'assigns the requested item as @item' do
        item = create :item, valid_attributes

        put :update, { id: item.to_param, item: valid_attributes }

        expect(assigns(:item)).to eq(item)
      end

      it 'redirects to the item' do
        item = create :item, valid_attributes

        put :update, { id: item.to_param, item: valid_attributes }

        expect(response).to redirect_to(item)
      end
    end

    describe 'with invalid params' do
      it 'assigns the item as @item' do
        item = create :item, valid_attributes

        put :update, { id: item.to_param, item: invalid_attributes }

        expect(assigns(:item)).to eq(item)
      end

      it "re-renders the 'edit' template" do
        item = create :item, valid_attributes

        put :update, { id: item.to_param, item: invalid_attributes }

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested item' do
      item = create :item, valid_attributes

      expect {
        delete :destroy, { id: item.to_param }
      }.to change(Item, :count).by(-1)
    end

    it 'redirects to the items list' do
      item = create :item, valid_attributes

      delete :destroy,  { id: item.to_param }

      expect(response).to redirect_to(items_url)
    end
  end
end
