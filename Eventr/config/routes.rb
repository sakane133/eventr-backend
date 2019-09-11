Rails.application.routes.draw do

  # resources :users, only: [:index, :show]
  resources :events, only: [:index, :create, :destroy]
  resources :activities, only: [:index, :create]
  resources :activity_events, only: [:update]
  namespace :api do 
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to:  'users#profile'
    end
  end


  post '/generate_new', to: 'activities#generate'



end
