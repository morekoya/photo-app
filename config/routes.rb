Rails.application.routes.draw do
root 'photos#index'
devise_for :users
resources :photos
resources :users
get 'user-pictures', to: 'photos#user_pictures'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
