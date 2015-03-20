require 'rails_helper'

RSpec.describe ServicesController, type: :controller do

  let(:valid_attributes) { attributes_for :service }
  let(:invalid_attributes) { attributes_for :invalid_service }
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'assigns all services as @services' do
      service = create :service, valid_attributes

      get :index, {}, valid_session

      expect(assigns(:services)).to eq([service])
    end
  end

  describe 'GET #show' do
    it 'assigns the requested service as @service' do
      service = create :service, valid_attributes

      get :show, { id: service.to_param}, valid_session

      expect(assigns(:service)).to eq(service)
    end
  end

  describe 'GET #new' do
    it 'assigns a new service as @service' do
      get :new, {}, valid_session

      expect(assigns(:service)).to be_a_new(Service)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested service as @service' do
      service = create :service, valid_attributes

      get :edit, { id: service.to_param}, valid_session

      expect(assigns(:service)).to eq(service)
    end
  end

  describe 'POST #create' do
    describe 'with valid params' do
      it 'creates a new Service' do
        expect {
          post :create, { service: valid_attributes}, valid_session
        }.to change(Service, :count).by(1)
      end

      it 'assigns a newly created service as @service' do
        post :create, { service: valid_attributes}, valid_session

        expect(assigns(:service)).to be_a(Service)
        expect(assigns(:service)).to be_persisted
      end

      it 'redirects to the created service' do
        post :create, { service: valid_attributes}, valid_session

        expect(response).to redirect_to(Service.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved service as @service' do
        post :create, { service: invalid_attributes}, valid_session

        expect(assigns(:service)).to be_a_new(Service)
      end

      it "re-renders the 'new' template" do
        post :create, { service: invalid_attributes}, valid_session

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { attributes_for :service }

      it 'updates the requested service' do
        service = create :service, valid_attributes

        put :update, { id: service.to_param, service: new_attributes}, valid_session

        service.reload

        expect(service.name).to eq(new_attributes[:name])
      end

      it 'assigns the requested service as @service' do
        service = create :service, valid_attributes

        put :update, { id: service.to_param, service: valid_attributes}, valid_session

        expect(assigns(:service)).to eq(service)
      end

      it 'redirects to the service' do
        service = create :service, valid_attributes

        put :update, { id: service.to_param, service: valid_attributes}, valid_session

        expect(response).to redirect_to(service)
      end
    end

    describe 'with invalid params' do
      it 'assigns the service as @service' do
        service = create :service, valid_attributes

        put :update, { id: service.to_param, service: invalid_attributes}, valid_session

        expect(assigns(:service)).to eq(service)
      end

      it "re-renders the 'edit' template" do
        service = create :service, valid_attributes

        put :update, { id: service.to_param, service: invalid_attributes}, valid_session

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested service' do
      service = create :service, valid_attributes
      expect {
        delete :destroy, { id: service.to_param}, valid_session
      }.to change(Service, :count).by(-1)
    end

    it 'redirects to the services list' do
      service = create :service, valid_attributes

      delete :destroy, { id: service.to_param}, valid_session

      expect(response).to redirect_to(services_url)
    end
  end

end
