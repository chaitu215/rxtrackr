Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:      'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  resources :users
  resources :medications
end
