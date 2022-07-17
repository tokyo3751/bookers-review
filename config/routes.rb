Rails.application.routes.draw do

  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'homes#top'
  devise_for :users

  get 'home/about' => 'homes#about'

  resources :books do
    resources :book_comments, only:[:create, :destroy]
    resource :favorites, only:[:create, :destroy]
  end

  resources :users
end
