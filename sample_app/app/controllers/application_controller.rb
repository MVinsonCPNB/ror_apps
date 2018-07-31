class ApplicationController < ActionController::Base
        # Built-in mechanism for preventing CSRF
    protect_from_forgery with: :exception
    
        # Stores temp cookies which are destroyed
        # upon the user closing the browser
        # Because it is in ApplicationConroller
        #  SessionHelper available in all views
    include SessionsHelper

end
