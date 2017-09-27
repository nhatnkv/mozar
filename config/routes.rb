Rails.application.routes.draw do
  resources :images
  namespace :manager do
    resources :products
    resources :categories
  end
  root 'homes#index'
  get 'homes/index' => "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
