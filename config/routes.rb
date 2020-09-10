Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"

    get "/signup", to: "users#new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    get "/logout", to: "sessions#destroy"
    get "/users/:id/stores", to: "stores#index", as: "stores"
    resources :users, only: %i(show new create)
    resources :slots, only: %i(show index) do
      resources :stores, only: %i(show new create)
    end
    get "stores/:id/destroy", to: "stores#destroy", as: "destroy_store"
    resources :terminals, only: :show

    devise_for :employees, controllers: { sessions: "employees/sessions" }

    resources :employees, only: %i(show index)
    resources :contracts, only: %i(index show update)
    resources :slots, only: %i(show index)
    resources :notifications, only: %i(index update)
  end
end
