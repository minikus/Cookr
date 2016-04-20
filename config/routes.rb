Rails.application.routes.draw do

  get '/chefs' => 'chefs#display'

  root :to => 'pages#welcome'

  get 'pages/welcome'
  get '/signup' => 'users#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  get '/treefrogs' => 'events#get_menus'

  get '/current_user' => 'users#get_user'
  get '/get_users' => 'users#get_users'
  get '/getmessages' => 'messages#get_messages'

  resources :users do
    resources :reviews
  end
  resources :menus

  resources :messages
  resources :events do
    put '/confirm' => 'events#confirm'
    delete '/confirm' => 'events#cancel'
  end
  resources :users

end
