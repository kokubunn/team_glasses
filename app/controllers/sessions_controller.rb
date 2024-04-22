class SessionsController < ApplicationController
    def new

    end

    def create
      user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:success] = "ログインしました。"
            redirect_to root_path
        else
            flash[:now] = "ログイン失敗しました。もう一度試してください。"
            render action: :new, status: :unprocessable_entity
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:success] = "ログアウトしました。"
        redirect_to root_path
    end
end
