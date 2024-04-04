class SignupController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.new
        @user.attributes = params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
        @user.save!
        session[:user_id] = @user.id
        flash[:success] = "アカウントを作成しました。"
        redirect_to root_path

    rescue ActiveRecord::RecordInvalid
        render action: :new, status: :unprocessable_entity
    end

    def user_params
        params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end
end
