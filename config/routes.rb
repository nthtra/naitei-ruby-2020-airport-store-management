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
    resources :slots, only: :show
  end
end
