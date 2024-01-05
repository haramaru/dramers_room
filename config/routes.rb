Rails.application.routes.draw do

  namespace :admin do
    get 'region_genres/index'
  end
  namespace :admin do
    get 'reviews/show'
  end
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  scope module: :public do
    get 'users/confirm'
    patch 'users/withdraw'
    resources :users, only: [:show, :edit, :update] do
      resource :relationship, only: [:create, :destroy]
    end
    resources :shops, only: [:show, :index, :update]
    resources :reviews, only: [:new, :create, :show] do
      resource :review_favorites, only: [:create, :destroy]
      resources :comments, only: [:create] do
        resource :comment_favorites, only: [:create, :destroy]
      end
    end
  end

  namespace :admin do
    get 'homes/top'
    resources :shops, only: [:new, :create, :show, :edit, :update, :index]
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:show, :destroy]
    resources :comments, only: [:show, :destroy]
    resources :region_genres, only: [:create, :index, :edit, :update]
  end

  get '/' => 'public/homes#top', as: 'root'
  get '/about' => 'public/homes#about', as: 'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
