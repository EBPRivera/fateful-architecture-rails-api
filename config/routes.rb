Rails.application.routes.draw do
  resources :users, only: %i[show] do
    resources :characters
  end
  resources :users, only: %i[create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"
end
