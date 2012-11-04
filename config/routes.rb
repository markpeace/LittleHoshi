Littlehoshi::Application.routes.draw do
  
  resources :users
  match "register"=>"users#new"
	
  get "boxes"=>"splash#theboxes"
  get "pricing"=>"splash#pricing"
  root :to=>"splash#index"
end
