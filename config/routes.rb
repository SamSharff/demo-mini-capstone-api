Rails.application.routes.draw do
  get "/products" => "products#index"
  post "/products" => "products#create"
  get "/products/:id" => "products#show"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  post "/users" => "users#create" #SIGNUP
  delete "/users/:id" => "users#destroy" #SIGNUP

  post "/sessions" => "sessions#create" #LOGIN

  post "/orders" => "orders#create" 
  get "/orders/:id" => "orders#show"
  get "/orders" => "orders#index" 

  post "/carted_products" => "carted_products#create"
end
