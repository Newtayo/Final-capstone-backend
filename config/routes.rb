Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  get 'api/v1/laptops', to: 'laptops#index'
  post 'api/v1/laptops', to: 'laptops#create'
  delete 'api/v1/laptops/:id', to: 'laptops#destroy'
  post 'api/v1/login', to: 'api/v1/users#login'
  post 'api/v1/signup', to: 'api/v1/users#signup'
  delete 'api/v1/reservation/:id', to: 'reservations#destroy'
  post 'api/v1/reservations/', to: 'reservations#create'
  get 'api/v1/reservations/', to: 'api/v1/reservations#index'

end