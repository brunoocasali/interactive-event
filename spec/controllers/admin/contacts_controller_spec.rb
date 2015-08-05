require 'rails_helper'

RSpec.describe Admin::ContactsController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET index' do
    it 'assigns all contacts as @contacts' do
      contact = Contact.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:contacts)).to eq([contact])
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Contact' do
        expect do
          post :create, { contact: valid_attributes }, valid_session
        end.to change(Contact, :count).by(1)
      end

      it 'assigns a newly created contact as @contact' do
        post :create, { contact: valid_attributes }, valid_session
        expect(assigns(:contact)).to be_a(Contact)
        expect(assigns(:contact)).to be_persisted
      end

      it 'redirects to the created contact' do
        post :create, { contact: valid_attributes }, valid_session
        expect(response).to redirect_to(Contact.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved contact as @contact' do
        post :create, { contact: invalid_attributes }, valid_session
        expect(assigns(:contact)).to be_a_new(Contact)
      end

      it "re-renders the 'new' template" do
        post :create, { contact: invalid_attributes }, valid_session
        expect(response).to render_template('new')
      end
    end
  end
end
