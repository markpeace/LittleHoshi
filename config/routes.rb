Littlehoshi::Application.routes.draw do
  
  get "activities/:activity_id/ingredients/new" => "ingredientisations#new"
  post "ingredientisations" => "ingredientisations#create"
  get "activities/:activity_id/ingredients/:id/edit" => "ingredientisations#edit"
  put "ingredientisation.:id" => "ingredientisations#update"
  delete "activities/:activity_id/ingredients/:id" => "ingredientisations#destroy"


  resources :ingredients

  resources :activities

  match "administer"=>"administer#index"

  resources :boxes

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
