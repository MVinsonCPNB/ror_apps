class SessionsController < ApplicationController
  def new
  end

  def create
        #Read teh paramerters passed by a form and try to 
        #log a user in by verifying the user entered password
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          log_in user       # defined in sessions_helper
          remember user     # defined in sessions_helper
          redirect_to user  # automatically routes to user's profile page
      else
          flash.now[:danger] = 'Invalid email/password combination'
          # Create an error message
          render 'new'
      end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
