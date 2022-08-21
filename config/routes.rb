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

  end

  namespace :public do
    resources :addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :orders, only: [:new, :create, :index, :show] do
      get "confirm" => "orders#confirm"
      get "thanks" => "orders#thanks"
    end
    resources :cart_items, only: [:index, :update, :destroy, :create] do
     collection do
      delete "destroy_all" => "cart_items#destroy_all"
     end
    end
    resource :customers, only: [:show, :edit, :update, :destroy] do
     collection do
      get "withdrawal" => "customers#withdrawal"
     end
    end

    resources :items, only: [:index, :show]
    resources :homes, only: [:top, :about]
  end

end
