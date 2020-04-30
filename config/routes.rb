Rails.application.routes.draw do
  get 'top' => 'homes#top'
  root "homes#top"

  get 'admins/index'
  get 'admins/show'
  get 'admins/edit'
  get 'photos/index'
  get 'photos/show'
  get 'photos/edit'
  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  resources :customers do
  resources :photos
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  resources :customers, only: [:show, :edit, :update]
end