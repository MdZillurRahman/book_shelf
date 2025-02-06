Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get "/", to: "main#index"
  root to: "main#index"

  # account sign_up
  get "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  # account sign_in
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"

  # account sign_out
  delete "logout", to: "sessions#destroy"

  get 'books/all', to: 'books#index_all', as: 'all_books'
  resources :books

  get "explore", to: "explore#index", as: :explore
end
