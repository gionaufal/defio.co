class HomeController < ApplicationController
    def index
      @user = User.find_by_username(current_user.username)
    end
end
