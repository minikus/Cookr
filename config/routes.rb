Rails.application.routes.draw do

  get '/chefs' => 'chefs#display'

  root :to => 'pages#welcome'

  get 'pages/welcome'

  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :users do
    resources :reviews
  end

  resources :messages
  resources :menus
  resources :events
  resources :users

end
