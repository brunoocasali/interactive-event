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
      @user.password = Devise.friendly_token
      @user.save

      respond_with(:admin, @user)
    end

    def update
      @user.update_without_password(user_params)

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
      params.require(:user).permit(:email, :phone, :name, :role_id)
    end
  end
end
