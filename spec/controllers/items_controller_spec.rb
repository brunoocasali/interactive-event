require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:valid_attributes) { create(:item) }
  let(:invalid_attributes) { create(:item) }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all items as @items' do
      item = Item.create! valid_attributes

      get :index, {}, valid_session

      expect(assigns(:items)).to include(item)
    end
  end

  describe 'GET #show' do
    it 'assigns the requested item as @item' do
      item = Item.create! valid_attributes

      get :show, {id: item.to_param}, valid_session

      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'GET #new' do
    it 'assigns a new item as @item' do
      get :new, {}, valid_session

      expect(assigns(:item)).to be_a_new(Item)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested item as @item' do
      item = Item.create! valid_attributes

      get :edit, {id: item.to_param}, valid_session

      expect(assigns(:item)).to eq(item)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Item' do
        expect {
          post :create, {item: valid_attributes}, valid_session
        }.to change(Item, :count).by(1)
      end

      it 'assigns a newly created item as @item' do
        post :create, {item: valid_attributes}, valid_session

        expect(assigns(:item)).to be_a(Item)
        expect(assigns(:item)).to be_persisted
      end

      it 'redirects to the created item' do
        post :create, {item: valid_attributes}, valid_session

        expect(response).to redirect_to(Item.last)
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved item as @item' do
        post :create, {item: invalid_attributes}, valid_session

        expect(assigns(:item)).to be_a_new(Item)
      end

      it "re-renders the 'new' template" do
        post :create, {item: invalid_attributes}, valid_session

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT #update' do
    describe 'with valid params' do
      let(:new_attributes) {
        skip('Add a hash of attributes valid for your model')
      }

      it 'updates the requested item' do
        item = Item.create! valid_attributes

        put :update, {id: item.to_param, item: new_attributes}, valid_session
        item.reload

        skip('Add assertions for updated state')
      end

      it 'assigns the requested item as @item' do
        item = Item.create! valid_attributes

        put :update, {id: item.to_param, item: valid_attributes}, valid_session

        expect(assigns(:item)).to eq(item)
      end

      it 'redirects to the item' do
        item = Item.create! valid_attributes

        put :update, {id: item.to_param, item: valid_attributes}, valid_session

        expect(response).to redirect_to(item)
      end
    end

    describe 'with invalid params' do
      it 'assigns the item as @item' do
        item = Item.create! valid_attributes

        put :update, {id: item.to_param, item: invalid_attributes}, valid_session

        expect(assigns(:item)).to eq(item)
      end

      it "re-renders the 'edit' template" do
        item = Item.create! valid_attributes

        put :update, {id: item.to_param, item: invalid_attributes}, valid_session

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested item' do
      item = Item.create! valid_attributes

      expect {
        delete :destroy, {id: item.to_param}, valid_session
      }.to change(Item, :count).by(-1)
    end

    it 'redirects to the items list' do
      item = Item.create! valid_attributes

      delete :destroy, {id: item.to_param}, valid_session

      expect(response).to redirect_to(items_url)
    end
  end
end
