Rails.application.routes.draw do
 resources :users, only: [:show] do
  resources :boards, except: [:index, :show]
 end
resources :boards, only: [:index, :show] do
  resources :reviews, only: [:create, :destroy]
end
  devise_for :users


  root to: "pages#home"
end
