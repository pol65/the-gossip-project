Rails.application.routes.draw do
  root 'dynamic_pages#welcome'
  get 'home', :to => 'static_pages#index'
  get 'team', :to => 'static_pages#team'
  get 'contact', :to => 'static_pages#contact'
  get 'welcome', :to => 'dynamic_pages#welcome'
  get 'welcome/:first_name', :to => 'dynamic_pages#welcome'
  post '/', :to => 'static_pages#index'
  get 'gossip/:page', :to => 'dynamic_pages#gossip'
  get 'user/:profile', :to => 'dynamic_pages#user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
