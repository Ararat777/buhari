Rails.application.routes.draw do
  
  devise_for :admin, controllers:{
    sessions: 'admin/sessions'
    
    },path_names:{sign_in: 'login'}
  root "store#index"
  resources :products, only: [:index,:show], path: 'products/:category'
  resources :order_items, only: [:create, :update,:destroy]
  resource :cart, only: [:show]
  namespace :admin do
    resources :products, except: [:show] do
      resources :option_products, except: [:show]
    end
    resources :orders,only: [:index,:show]
    resources :categories
    get '/home' => 'store#index'
    get '/products/:product_id/new_thumb' => 'products#new_thumb', as: 'new_product_thumb'
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
