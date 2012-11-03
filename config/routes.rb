Littlehoshi::Application.routes.draw do
  get "boxes"=>"splash#theboxes"
  get "pricing"=>"splash#pricing"
  root :to=>"splash#index"
end
