Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  

  resources :companies, only: [:show, :new, :create] do
    resources :connections, only: [:create, :destroy]
  end

  resources :connections, only: [:show] do
    resources :connection_years, only: [:create]
  end

  resources :connection_years, only: [:destroy]
end
