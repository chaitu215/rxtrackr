Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:      'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  match '/auth/:provider/callback', to: 'devise/sessions#create', via: [:get, :post]
  match '/logout', to: 'devise/sessions#destroy', via: [:get, :post]
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/privacy', to: 'static_pages#privacy'
  get  '/terms',   to: 'static_pages#terms'
  get  '/medications/most_recent', to:'medications#most_recent', as: '/most_recent'
  resources :users, only: [:index, :show, :edit, :delete] do
    resources :medications
  end
  resources :medications
  resources :medications, only: [:new, :show, :edit, :delete] do
    resources :notes
  end
  resources :notes
end
