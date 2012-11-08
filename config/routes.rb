Littlehoshi::Application.routes.draw do
  
  resources :invitations

  get "sessions/new"

  get "sessions/create"

  get "sessions/destroy"

  resources :users
  match "register"=>"users#new"

  get "login"=>"sessions#new"
  post "login"=>"sessions#create"
  match "logout"=>"sessions#destroy"

  get "boxes"=>"splash#theboxes"
  get "pricing"=>"splash#pricing"
  root :to=>"splash#index"
end
