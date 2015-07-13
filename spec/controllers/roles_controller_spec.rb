require 'rails_helper'

RSpec.describe RolesController, type: :controller do
  let(:valid_attributes) { attributes_for :role }
  let(:invalid_attributes) { attributes_for :invalid_role }

  describe 'GET index' do
    it 'assigns all roles as @roles' do
      role = create(:role, valid_attributes)

      get :index

      expect(assigns(:roles)).to include(role)
    end
  end

  describe 'GET new' do
    it 'assigns a new role as @role' do
      get :new

      expect(assigns(:role)).to be_a_new(Role)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested role as @role' do
      role = create(:role, valid_attributes)

      get :edit, id: role.to_param

      expect(assigns(:role)).to eq(role)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Role' do
        expect do
          post :create, role: valid_attributes
        end.to change(Role, :count).by(1)
      end

      it 'assigns a newly created role as @role' do
        post :create, role: valid_attributes

        expect(assigns(:role)).to be_a(Role)
        expect(assigns(:role)).to be_persisted
      end

      it 'redirects to the created role' do
        post :create, role: valid_attributes

        expect(response).to redirect_to(Role.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved role as @role' do
        post :create, role: invalid_attributes

        expect(assigns(:role)).to be_a_new(Role)
      end

      it "re-renders the 'new' template" do
        post :create, role: invalid_attributes

        expect(response).to render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      let(:new_attributes) { attributes_for :role }

      it 'updates the requested role' do
        role = create(:role, valid_attributes)

        put :update, id: role.to_param, role: new_attributes
        role.reload

        expect(role.key).to eq(new_attributes[:key])
        expect(role.name).to eq(new_attributes[:name])
        expect(role.description).to eq(new_attributes[:description])
      end

      it 'assigns the requested role as @role' do
        role = create(:role, valid_attributes)

        put :update, id: role.to_param, role: valid_attributes

        expect(assigns(:role)).to eq(role)
      end

      it 'redirects to the role' do
        role = create(:role, valid_attributes)

        put :update, id: role.to_param, role: valid_attributes

        expect(response).to redirect_to(role)
      end
    end

    describe 'with invalid params' do
      it 'assigns the role as @role' do
        role = create(:role, valid_attributes)

        put :update, id: role.to_param, role: invalid_attributes

        expect(assigns(:role)).to eq(role)
      end

      it "re-renders the 'edit' template" do
        role = create(:role, valid_attributes)

        put :update, id: role.to_param, role: invalid_attributes

        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested role' do
      role = create(:role, valid_attributes)
      expect do
        delete :destroy, id: role.to_param
      end.to change(Role, :count).by(-1)
    end

    it 'redirects to the roles list' do
      role = create(:role, valid_attributes)

      delete :destroy, id: role.to_param

      expect(response).to redirect_to(roles_url)
    end
  end
end
