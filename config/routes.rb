Rails.application.routes.draw do
  get 'top' => 'homes#top'
  root "homes#top"
  get 'about' => 'homes#about'
  get 'admins/index'
  get 'admins/show'
  get 'admins/edit'
  get 'photos/index'
  get 'photos/show'
  get 'photos/edit'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  # devise_for :customers
  devise_for :customers, controllers: {
    sessions: 'customers/sessions'
  }

  # devise_for :admins
  devise_for :admins, controllers: {
   sessions: 'admins/sessions'
  }

  resources :photos do
  	resource :favorites, only: [:create, :destroy]
  	resource :comments, only: [:create]
  end
  resources :customers do
  	member do
  		get :favolist
  		get :destroy_cus
  		get :follower, :followed
  	end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
#  resources :customers, only: [:show, :edit, :update]
end