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
  get '/search' => 'users#search', :as => 'search_page'
  resources :organizations
  resources :users
  resources :posts
  resources :experiences
  # resources :posts do
  #   resources :reviews
    # resources :comments

  # end
  post '/notifications/read/:id', to: 'notifications#read'

  resources :notifications
      # post :mark_read
  post '/attendees/new/:id', to: 'events#attend', as: :attend
  post '/attendees/del/:id', to: 'events#unattend', as: :unattend

  resources :events do
  end

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
