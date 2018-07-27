module SessionsHelper

        # Logs in the given user
    def log_in(user)
        # Places a temp cookie on the user's browser
        # containing an encrypted version of the
        # user's id
        session[:user_id] = user.id
    end
end
