Rails.application.routes.draw do

  resources :users, only: [:index, :show]
  resources :events, only: [:index, :create, :destroy]
  resources :activities, only: [:index, :create]
  resources :activity_events, only: [:update]

  post '/generate_new', to: 'activities#generate'


end
