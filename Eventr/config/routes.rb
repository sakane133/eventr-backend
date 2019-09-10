Rails.application.routes.draw do

  resources :users, only: [:index, :show]
  resources :events, only: [:index, :create]
  resources :activities, only: [:index, :create]
  resources :activity_events, only: [:update]

end
