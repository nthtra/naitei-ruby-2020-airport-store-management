Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :users, only: %i(show new create)
    resources :terminals, only: :show
    get "/employees/login", to: "employee_sessions#new"
    post "/employees/login", to: "employee_sessions#create"
    delete "/employees/logout", to: "employee_sessions#destroy"
    resources :employees, only: :show
    resources :contracts, only: %i(index show)
    resources :slots, only: :index
  end
end
