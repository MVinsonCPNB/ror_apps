class UsersController < ApplicationController
 
  def show
    @user = User.find(params[:id])

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
    @user = User.new(user_params)         
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      # (BELOW) equivalent redirect_to user_url(@user).
      # automatically loads the users/show page.
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
