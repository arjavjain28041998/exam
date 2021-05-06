Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get '/' => 'users#signup'
get '/users' => 'users#create'
get '/login' => 'users#login'
get'/dashboard'=> 'auth#index'
get '/studashboard' => 'auth#student'
post '/sessions' => 'sessions#create'
get '/logout' => 'sessions#destroy'
get '/add' => 'questions#question'
get '/added' => 'questions#create'
end
