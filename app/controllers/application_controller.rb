class ApplicationController < ActionController::Base
    
    def login_user(user)
        session[:current_user]=user.id
    end

    def current_user
        if session[:current_user]
            @user ||= User.find_by(id:session[:current_user])
            @user ? @user : nil
        else 
            nil
        end
    end

    helper_method :current_user
end
