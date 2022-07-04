Rails.application.routes.draw do
  root :to =>"homes#top"
  devise_for :users
  get "home/about"=>"homes#about", as: 'about'

  resources :users, only: [:index,:show,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:new, :create, :index, :show, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

end