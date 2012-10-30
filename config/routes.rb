Littlehoshi::Application.routes.draw do
  get "splash/index"
	root :to=>"splash#index"
end
