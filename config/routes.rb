Rails.application.routes.draw do

  root 'welcome#index'

  resources :users
  resources :gossips
  resources :cities
  resources :welcome
  resources :team
  resources :contact
  resources :sessions, only: [:new, :create, :destroy]

  resources :gossips do
    resources :likes
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
