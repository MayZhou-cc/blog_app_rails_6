Rails.application.routes.draw do
  resources :articles
  #root 'application#hello' # means 'application_controller', root expect a hello function which is in the application_controller.
  root 'pages#home'
  get 'about', to: 'pages#about'
end
