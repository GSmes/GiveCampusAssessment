Rails.application.routes.draw do
  root "campaigns#index"

  resources :campaigns, only: [:index, :show] do
    resources :donations, only: [:new, :create]
  end
end
