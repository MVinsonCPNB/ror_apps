Rails.application.routes.draw do
    get 'users/new'

    root 'static_pages#home'

    # using the get '/help', to: 'static_pages#help'
    # rails creates to paths the 
    # help_path -> '/help'  AND THE help_url -> 'http://www.example.com/help'

    get '/help',       to: 'static_pages#help'
    get '/about',      to: 'static_pages#about'
    get '/contact',    to: 'static_pages#contact'
    get '/signup',     to: 'users#new'    
    resources :users

    # Note: get 'static_pages/help' make a symbol avaialble
    # such as, static_pages_help_url


    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
