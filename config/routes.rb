Rails.application.routes.draw do
  # get "todos", to: "todos#index"             #lists all the todos
  # post "todos", to: "todos#create"           #adds a todo to the list
  # get "todos/:id", to: "todos#show"          #shows 1 todo based on para id

  # root :to => "/"

  get "/" => "home#index"

  resources :todos

  resources :users

  get "/signin" => "sessions#new", as: :new_sessions
  post "/signin" => "sessions#create", as: :sessions
  delete "/signout" => "sessions#destroy", as: :destroy_session
end
