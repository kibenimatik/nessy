Rails.application.routes.draw do
  resources :accounts, only: [:create, :index, :show]
  root to: 'pages#index'
end
