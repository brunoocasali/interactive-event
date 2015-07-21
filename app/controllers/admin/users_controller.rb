module Admin
  class UsersController < Admin::AdminController
    load_and_authorize_resource

    def index
      @users = User.allowed
    end

    def show
      @joined_on = @user.created_at.to_formatted_s(:short)
      if @user.current_sign_in_at
        @last_login = @user.current_sign_in_at.to_formatted_s(:short)
      else
        @last_login = 'nunca acessou!'
      end

      respond_with([@user, @last_login, @joined_on],
                   location: admin_user_path(@user))
    end

    def new; end

    def edit; end

    def create
      @user.save

      respond_with(:admin, @user)
    end

    def update
      if user_params[:password].blank?
        user_params.delete(:password)
        user_params.delete(:password_confirmation)
      end

      if needs_password?(@user, user_params)
        @user.update(user_params)
      else
        @user.update_without_password(user_params)
      end

      respond_with(:admin, @user)
    end

    def destroy
      @user.destroy

      respond_with(:admin, @user)
    end

    private

    def needs_password?(_user, params)
      params[:password].present?
    end

    def user_params
      params.require(:user).permit(:email, :phone, :password, :name, :role_id,
                                   :password_confirmation)
    end
  end
end
