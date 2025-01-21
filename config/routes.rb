Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get "/", to: "main#index"
  root to: "main#index"

  get "explore", to: "explore#index", as: :explore
end
