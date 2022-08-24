Rails.application.routes.draw do
  resources :images
  resources :teams
  resources :blogs do
    resources :comments,only:[:create]
  end
  resources :roles
  resources :idcards

  resources :devices
  resources :payslips
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'organizations#welcome'
  get 'organizations/home'

  get 'employees/new_hire'
  get 'organizations/aboutus'
  get 'organizations/contact'
  get 'sign_up', to: 'employees#new'
  resources :employees, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :devices do
    member do
      get 'employees'
    end
  end
  resources :teams do
    member do
      get 'employees'
    end
  end
  resources :employees do
    member do
      get 'idcard'
      get 'payslip'
      get 'team'
      get 'asset'
      get 'role'
    end
  end
  resources :likes,only: [:new,:create,:index]
  put '/blog/:id/like',to:'blogs#like',as:'like'
end
