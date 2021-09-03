Rails.application.routes.draw do
  devise_for :doctors
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :appointments, except: [:new, :create]
  resources :doctors do
    resources :appointments, only: [:new, :create]
  end
  resources :users do
    resources :medical_records, only: [:index, :new, :create]
  end
end

# except: [:new, :create]
