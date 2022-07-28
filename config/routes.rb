Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get 'home/about' => 'public/homes#about', as: "about"
  namespace :admin do
    get 'admin/homes/top' => 'homes#top'
  end
  namespace :admin do
    resources :order_details, only: [:update]
    get 'order_details/update'
  end
  namespace :admin do
    resources :order, only: [:index, :update]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
  end
  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
  end
  namespace :public do
    resources :order, only: [:new, :confirm, :thanks, :create, :index, :show]
  end
  namespace :public do
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
  end
  namespace :public do
    resources :customers, only: [:show, :edit, :update, :withdrawal, :destroy]
  end
  namespace :public do
    resources :sessions, only: [:new, :create, :destroy]
  end
  namespace :public do
    resources :registrations, only: [:new, :create]
  end
  namespace :public do
    resources :items, only: [:index, :show]
  end
  namespace :public do
    resources :homes, only: [:top, :about]
  end

end
