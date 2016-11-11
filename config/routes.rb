Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  namespace :users do
    resources :boards
  end
  resource :profile, only: [:show, :edit, :update]

  resources :boards do
    resources :availabilities, shallow: true do
      patch 'make_booking', on: :member
      patch 'cancel_booking', on: :member
    end
  end

  root to: "pages#home"
end


