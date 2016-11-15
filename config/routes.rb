Rails.application.routes.draw do
  resources :medications
  devise_for :users
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :users
end
