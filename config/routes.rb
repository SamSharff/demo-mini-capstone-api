Rails.application.routes.draw do
#  get "/all_products", controller: "products", action: "all_products"
get "/all_products" => "products#all_products"
get "/first_product" => "products#first_product"
end
