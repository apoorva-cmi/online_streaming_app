Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get :readme, controller:"application"

  resources :movies, only: [:index]
  resources :seasons, only: [:index]
  resources :contents, only: [:index]
  resources :purchases, only: [:index, :create]
  get "users/:id/library" => 'users#library'
end
