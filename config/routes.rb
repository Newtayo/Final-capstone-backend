Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get 'api/v1/laptops', to: 'laptops#index'
  post 'api/v1/laptops', to: 'laptops#create'
  delete 'api/v1/laptops/:id', to: 'laptops#destroy'
  post 'api/v1/login', to: 'api/v1/users#login'
  post 'api/v1/signup', to: 'users#create'
  delete 'api/v1/reservation/:id', to: 'reservations#destroy'
  post 'api/v1/reservation/', to: 'reservations#create'

end