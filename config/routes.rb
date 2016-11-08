Rails.application.routes.draw do
 resources :users, only: [:show] do
  resources :boards, only: [:new, :create, :edit, :destroy]
 end
resources :boards, only: [:index, :show]
  devise_for :users


  root to: "pages#home"
end
