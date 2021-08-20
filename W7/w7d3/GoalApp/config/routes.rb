Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :users, only: [:new, :create, :show]

  resources :users, except: [:destroy, :edit, :update]
end
