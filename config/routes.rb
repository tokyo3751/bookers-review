Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users

  get 'homes/about' => 'homes#about'

  resources :books
  resources :users, only:[:index,:show,:edit]
end
