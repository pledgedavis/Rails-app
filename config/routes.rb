Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#home' 
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new' 
  get '/logout' => 'sessions#destroy'
  
   resources :shoes 
   resources :users
end
