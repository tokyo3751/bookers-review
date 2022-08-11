Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  get 'home/about' => 'homes#about'
  get "search" => "searches#search"
  get 'chat/:id' => 'chats#show', as: 'chat'
  resources :chats, only: [:create]

  resources :books do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    get 'search' => 'users#search'
  end

  resources :groups, except:[:destroy]
end
