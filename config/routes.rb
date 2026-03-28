Rails.application.routes.draw do
  resources :tweets
  # root "posts#index"

  resources :users, only: [ :show ]
  get "/:account", to: "users#show", as: :account
end
