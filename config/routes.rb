Rails.application.routes.draw do
  root "tweets#index"

  resources :users, only: [ :show ]
  get "/:account", to: "users#show", as: :account

  resources :tweets, only: [ :index, :show, :new, :create, :destroy ]

end
