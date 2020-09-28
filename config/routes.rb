Rails.application.routes.draw do
  root to: 'matching_posts#index'
  resources :users
  resources :articles
  resources :matchings
	resources :time_frames, only: [:create, :destroy]
  resources :matching_posts, except: [:new] do
    collection do
      post 'preview'
    end
  end
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => 'user_sessions#create'
  post 'logout' => 'user_sessions#destroy', :as => :logout
end
