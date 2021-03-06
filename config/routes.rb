Rails.application.routes.draw do
  devise_for :users, controllers:{ omniauth_callbacks: "user/omniauth_callbacks" }
  resources :articles

  root to: "home#index"
  get "todo", to: "articles#home_view"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
