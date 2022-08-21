Rails.application.routes.draw do

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
 }

# 管理者用
# URL /admin/sign_in ...
 devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
 }
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "public/homes#top"
  get 'home/about' => 'public/homes#about', as: "about"
  namespace :admin do
    get 'admin/homes/top' => 'homes#top'
    resources :order_details, only: [:update]
    get 'order_details/update'
    resources :order, only: [:index, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :sessions, only: [:new, :create, :destroy]
  end

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :confirm, :thanks, :create, :index, :show]
     collection do
      get "withdrawal" => "customers#withdrawal"
     end
    resources :cart_items, only: [:index, :update, :destroy, :destroy_all, :create]
    resources :customers, only: [:show, :edit, :update, :withdrawal, :destroy] do
     collection do
      get "confirm" => "customers#confirm"
      get "thanks" => "customers#thanks"
     end
    end
    resources :sessions, only: [:new, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :items, only: [:index, :show]
    resources :homes, only: [:top, :about]
  end

end
