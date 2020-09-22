Rails.application.routes.draw do
root :to => 'offering_posts#index'
resources :users
resources :offering_posts
resources :matchings
resources :relationships
get 'login' => 'user_sessions#new', :as => :login
post  'login'   => 'user_sessions#create'
post 'logout' => 'user_sessions#destroy', :as => :logout
end
