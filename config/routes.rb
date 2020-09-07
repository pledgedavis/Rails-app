Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#home' 
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' 
  get '/logout' => 'sessions#destroy'
  # omniuath callback 
  # get '/auth/facebook/callback' => 'sessions#create'
  get '/auth/:provider/callback' => 'sessions#fbcreate'
  get '/search' => 'shoes#shoebybrand'
  
   resources :shoes 
   resources :users

   resources :brands do 
    resources :shoes, only: [:new, :index]
   end 
end
