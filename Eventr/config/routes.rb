Rails.application.routes.draw do

  resources :users, only: [:index]
  resources :events, only: [:index]
  resources :activities, only: [:index, :create]

end
