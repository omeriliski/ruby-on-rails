Rails.application.routes.draw do
  scope 'api' do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
  
  # Web pages routes
  root 'pages#index'
  get 'tires', to: 'pages#tires_index', as: 'tires'
  get 'tires/new', to: 'pages#tires_new', as: 'tires_new'
  get 'tires/:id', to: 'pages#tires_show', as: 'tires_show'
  get 'tires/:id/edit', to: 'pages#tires_edit', as: 'tires_edit'
  
  get 'brands', to: 'pages#brands_index', as: 'brands'
  get 'brands/new', to: 'pages#brands_new', as: 'brands_new'
  get 'brands/:id/edit', to: 'pages#brands_edit', as: 'brands_edit'
  
  get 'register', to: 'pages#register', as: 'register'
  get 'login', to: 'pages#login', as: 'login'
  get 'profile', to: 'pages#profile', as: 'profile'
  
  # API routes
  namespace 'api' do
    resources :tires, :brands
  end
  
  get "up" => "rails/health#show", as: :rails_health_check
end
