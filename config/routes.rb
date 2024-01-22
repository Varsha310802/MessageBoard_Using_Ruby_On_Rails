Rails.application.routes.draw do
  devise_for :users
  resources :messages do
    resources :comments
  end

  resources :comments, only: [:show, :destroy]

  root 'messages#index'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
