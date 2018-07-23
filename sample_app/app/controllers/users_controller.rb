class UsersController < ApplicationController
 
    def show
        #TODO the redirect to show from the create method tries to 
        #access user_params, and user_params shows there is no 
        #paramert passed to this method, either create a gloable 
        #call method set within user_params or within user.save true
        #if statment section
        @user = User.find(@user.id)

        # the dubugger opens a active debuggin console 
        # in the rails server terminal used to view
        # all data and instance variables active in the 
        # program
        #debugger        # provided by the byebug gem
    end
      
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)     # Not the final implementation!
        
        if @user.save
            flash[:success] = "Welcome to the Sample App!"
            # (BELOW) equivalent redirect_to user_url(@user)
            redirect_to @user
        else
            render 'new'
        end
    end

        
    private 
        def user_params
            params.require(:user).permit(:name, :email,
                                         :password,
                                         :password_confirmation)
        end
end
