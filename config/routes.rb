Rails.application.routes.draw do
  get 'top' => 'homes#top'
  root "homes#top"
  get 'about' => 'home#about'
  get 'admins/index'
  get 'admins/show'
  get 'admins/edit'
  get 'photos/index'
  get 'photos/show'
  get 'photos/edit'
  devise_for :customers

  devise_for :admins

  resources :photos do
  	resource :favorites, only: [:create, :destroy]
  end
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  resources :customers, only: [:show, :edit, :update]
end