Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'

  }
  devise_for :organizations, controllers: {
    sessions: 'organizations/sessions',
    registrations: 'organizations/registrations'
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.htmlp
  
  get '/organizations', to: 'homes#org', as: :org_root
  post '/events', to: 'events#attend', as: :attend
  get '/search' => 'users#search', :as => 'search_page'
  resources :organizations
  resources :users
  resources :posts
  # resources :posts do
  #   resources :reviews
    # resources :comments

  # end

  resources :notifications do
    collection do
      post :mark_read
    end
  end
  resources :events
  resources :jobs
  resources :comments
  resources :conversations, only: [:create,:index] do
    member do
      post :close
    end
    resources :messages, only: [:create]
  end

  resources :reviews

  resources :collections do
    member do
      delete :delete_image_attachment
    end
  end
  # if current_user || current_organization
  #   if current_user
  #     root to: "homes#index"
  #   else
  #     root to: "homes#org"
  #   end
  # else
    root to: "homes#index"
  # end

end
