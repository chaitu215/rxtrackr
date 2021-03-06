Rails.application.routes.draw do
  devise_for :users, controllers: { registrations:      'users/registrations',
                                    omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'static_pages#home'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/privacy', to: 'static_pages#privacy'
  get  '/terms',   to: 'static_pages#terms'
  get  '/medications/most_recent', to:'medications#most_recent', as: '/most_recent'
  get  '/users/:id/user_notes', to: 'users#user_notes', as: '/user_notes'
  resources :users, only: [:index, :show, :edit, :delete] do
    resources :medications
  end
  resources :users do
    resources :provider_profiles
  end
  resources :medications
  resources :medications, only: [:new, :show, :edit, :delete] do
    resources :notes
  end
  resources :medications, only: [:new, :show, :edit, :delete] do
    resources :provider_profiles
  end
  resources :notes
  resources :allergies
  resources :provider_profiles
end
