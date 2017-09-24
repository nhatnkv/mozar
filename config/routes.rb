Rails.application.routes.draw do
  namespace :manager do
    resources :categories
  end
  root 'homes#index'
  get 'homes/index' => "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
