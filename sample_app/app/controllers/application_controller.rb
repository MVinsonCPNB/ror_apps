class ApplicationController < ActionController::Base
        # Built-in mechanism for preventing CSRF
    protect_from_forgery with: :exception
    
        # Stores temp cookies which are destroyed
        # upon the user closing the browser
    include SessionHelper

end
