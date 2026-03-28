Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  root "tweets#index"
  resources :tweets, only: [ :index, :show, :new, :create, :destroy ]

  resources :users, only: [ :show ]
  get "/:account", to: "users#show", as: :account
end
