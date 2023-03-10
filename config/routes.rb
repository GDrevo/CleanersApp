Rails.application.routes.draw do
  devise_for :cleaners
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookings, only: %i[new create edit update index show delete]
  resources :cleaners, only: %i[new create edit update index show delete] do
    resources :availabilities, only: %i[new create edit update index delete]
  end
end
