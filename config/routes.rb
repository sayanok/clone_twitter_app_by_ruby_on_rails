Rails.application.routes.draw do

  # root "posts#index"

  resources :users, only:[:show]
  get '/:account', to: 'users#show', as: :account
end
