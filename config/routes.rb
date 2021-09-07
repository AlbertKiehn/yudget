Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :places, only: [:index, :show, :create, :new]
  get 'categories', to: 'pages#categories'
  resources :places do
    member do
      put 'upvote'
      put 'unvote'
      put 'upvotes'
      put 'unvotes'
    end
  end
  get 'likedplaces', to: 'places#likedplaces'
  get 'showplace', to: 'places#showplace'
  get 'map', to: 'places#map'
end
