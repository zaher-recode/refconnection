Rails.application.routes.draw do

  # get '/organizations/sign_up' => 'organizations/registrations'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }
  devise_for :organizations, controllers: {
    sessions: 'organizations/sessions',
    registrations: 'organizations/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "homes#index"
  resources :post
  resources :event
  resources :job



end
