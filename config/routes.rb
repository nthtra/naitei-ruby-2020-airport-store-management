Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/logout", to: "sessions#destroy"
    get "/users/:id/stores", to: "stores#index", as: "stores"
    resources :users, only: %i(show new create) do
      resources :stores, only: %i(show)
    end
    resources :terminals, only: :show
    get "/employees/login", to: "employee_sessions#new"
    post "/employees/login", to: "employee_sessions#create"
    delete "/employees/logout", to: "employee_sessions#destroy"
    resources :employees, only: :show
    resources :contracts, only: %i(index show)
    resources :slots, only: %i(show index)
    post "/store", to: "stores#create"
    resources :stores, only: %i(new)
  end
end
