class MainController < ApplicationController
    def index
        @user_data = {}
        User.all.each do |user|
            @user_data[user.user_name] = user.total_points
        end
    end
end
