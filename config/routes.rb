Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "tweets#index"
  resources :tweets, only: [ :index, :new, :create, :destroy ]
  get "/:account/tweets/:id", to: "tweets#show", as: :account_tweet

  resources :users, only: [ :show ]
  get "/:account", to: "users#show", as: :account
end
