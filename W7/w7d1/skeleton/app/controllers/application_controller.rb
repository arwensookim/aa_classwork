class ApplicationController < ActionController::Base
    #  CRRLLL

    def current_user
        @current_user ||= User.finy_by(session_token: session[:session_token])
    end

    def require_logged_in
        
    end

    def require_logged_out
    end

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def logged_in?
        !!current_user
    end

    def logout!
        current_user.reset_session_token! if logged_in?
        session[:session_token] = nil
        @current_user = nil
    end

end
