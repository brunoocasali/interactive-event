class UsersController < ApplicationController
  #load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit; end


  def create
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
  end

  def update
    if user_params[:password].blank?
      user_params.delete(:password)
      user_params.delete(:password_confirmation)
    end

    successfully_updated = if needs_password?(@user, user_params)
                             @user.update(user_params)
                           else
                             @user.update_without_password(user_params)
                           end

    respond_to do |format|
      if successfully_updated
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def needs_password?(user, params)
    params[:password].present?
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user)
        .permit(:email, :password, :password_confirmation, :name, :role_id)
  end
end
