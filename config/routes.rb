Researchr::Application.routes.draw do
  

  resources :users do
    resources :queries
  end

  #resources :sessions, only: [:new, :create, :destroy]
  get "/login", to: "session#new"
  post "/session", to: "session#create"
  delete "/session", to: "session#destroy"
  get "/about", to: "about#index"
  get "/contact", to: "contact#index"

  root "welcome#index"
end
