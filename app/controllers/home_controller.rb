class HomeController < ApplicationController
    def index
      if user_signed_in?
        @user = User.find_by_username(current_user.username)
      end
    end
end
