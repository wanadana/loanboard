Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users do
    resources :boards, controller: 'users/boards'
  end

  resources :boards, only: [:index, :show] do
  #   resources :reviews, only: [:create, :destroy]
    resources :availabilities, shallow: true do
      patch 'make_booking', on: :member
      patch 'cancel_booking', on: :member
    end
  end

  root to: "pages#home"
end


