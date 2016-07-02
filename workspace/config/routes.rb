Rails.application.routes.draw do
  resources :proposals
  resources :communities
  resources :notices
  devise_for :domitories, :controller => "passwords => passwords"
  
  root  :to => "domitory#index"
  match ":controller(/:action(/:id))", :via => [:post, :get]
end