Rails.application.routes.draw do
  root 'book#index'
  devise_for :users
  resources :book

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
