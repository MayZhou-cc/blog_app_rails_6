Rails.application.routes.draw do
  #root 'application#hello' # means 'application_controller', root expect a hello function which is in the application_controller.
  root 'pages#home'
  resources :articles#, only: [:show, :index]
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]

  # Login will not interact with db, so need to add it manually, and it will be controlled by sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
