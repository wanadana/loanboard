Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :boards
  end

  resources :borads, only: [:index, :show] do
  #   resources :reviews, only: [:create, :destroy]
   end



  root to: "pages#home"
end


