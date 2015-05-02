class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
    respond_with(@roles)
  end

  def show
    if @role.users.length == 0
      @assosciated_users = 'None'
    else
      @assosciated_users = @role.users.map(&:name).join(', ')
    end
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
    params.require(:role).permit(:name, :description)
  end
end
