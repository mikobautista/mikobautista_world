KcwWorld::Application.routes.draw do

  resources :articles
  resources :categories
  resources :photos
  resources :proverbs
  resources :comments
  
  match 'home' => 'home#index', :as => :home
  root :to => 'home#index'

end
