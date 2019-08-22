Rails.application.routes.draw do


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
  get '/organizations', to: 'homes#org', as: :org_root

  resources :organizations
  resources :users
  resources :posts
  resources :events
  resources :jobs

  resources :collections do
    member do
      delete :delete_image_attachment
    end
  end

end
