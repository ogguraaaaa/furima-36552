Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  root to: "items#index"
  resources :items do
    resources :purchase_histories, only: [:index, :create]
  end

end
