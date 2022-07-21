Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  get 'home/about' => 'homes#about'

  resources :books do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships/followings', as: 'followings'
    get 'followers' => 'relationships/followers', as: 'followers'
  end
end
