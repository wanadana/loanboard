Rails.application.routes.draw do
  devise_for :users
  get 'users/index'

  get 'users/show'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/destroy'

  root to: "pages#home"
end
