Rails.application.routes.draw do
  resources :deliveries
  resources :books
  resources :subscribers
  resources :employees
  resources :libraries
  root 'home_page#show_home_page'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
