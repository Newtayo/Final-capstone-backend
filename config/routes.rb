Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :laptops, only: [:index, :create, :destroy]
      post 'login', to: 'users#login'
      post 'signup', to: 'users#signup'
      resources :reservations, only: [:index, :create, :destroy]
    end
  end
end
