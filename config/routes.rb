Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  

  resources :companies, only: [:show, :new, :create] do
    resources :connections, only: [:new, :create]
    resource :savings, only: [:show]
  end

  # resources :years, only: [] do
  #   resources :connection_years, only: [:new]  
  # end


  resources :connections, only: [:destroy] do
  end

  resources :connections, only: [:show] do
    resources :connection_years, only: [:create]
  end

  resources :connection_years, only: [:destroy]
end
