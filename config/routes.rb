Rails.application.routes.draw do
  resources :orders
  resources :line_items
  resources :carts
  post "carts/update_checkout" => "carts#update_checkout"
  resources :images
  namespace :manager do
    resources :products
    resources :categories
  end
  root 'homes#index'
  get 'homes/index' => "homes#index"
  get 'homes/detail/:id' => "homes#detail", as: 'product_detail'
  get 'homes/show/' => "homes#show", as: 'product_show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
