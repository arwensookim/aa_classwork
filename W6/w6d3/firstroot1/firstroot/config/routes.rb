Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/new', to: 'users#new'
  post 'users', to: 'users#create'
  get 'users/:id/edit', to: 'users#edit'
  patch 'users/:id', to: 'users#update'
  delete 'users/:id', to: 'users#destroy'

  #Get user artworks and artworks shared to them
  get 'users/:id/artworks', to: 'artworks#index'

  resources :artworks, except: [:new, :edit, :index]
  resources :artwork_shares, except: [:new, :edit]

  resources :comments, only: [:create, :destroy, :index]
end
