# config/routes.rb
Rails.application.routes.draw do
  root 'listings#index'

  devise_for :users

  resources :listings

  namespace :admin do
    resources :listings, only: [:index] do
      member do
        patch :approve
        delete :reject
      end
    end
  end
end
