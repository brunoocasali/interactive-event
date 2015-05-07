class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
    respond_with(@roles)
  end

  def show
    if @role.users.size == 0
      @associated_users = 'None'
    else
      @associated_users = @role.users.map(&:name).join(', ')
    end

    respond_with(@role, @associated_users, location: @role)
  end

  def new
    @role = Role.new
    respond_with(@role)
  end

  def edit; end

  def create
    @role = Role.new(role_params)
    @role.save
    respond_with(@role)
  end

  def update
    @role.update(role_params)
    respond_with(@role)
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :description, :key)
  end
end
