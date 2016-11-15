Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations'}
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :users
  resources :medications
end
