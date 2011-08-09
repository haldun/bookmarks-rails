Bookmarklove::Application.routes.draw do
  get "logout" => 'sessions#destroy', :as => 'logout'

  root :to => 'bookmarks#index'

  resources :users
  resources :sessions
  resources :bookmarks
  resources :imports
  resources :tags

  mount Resque::Server, :at => "/resque"
end
