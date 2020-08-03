Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/' => 'sessions#home' 
  get '/login' => 'sessions#new' 
  get '/signup' => 'userss#new' 


   resources :shoes 
   resources :users
end
