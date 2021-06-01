Rails.application.routes.draw do
  # get "todos", to: "todos#index"             #lists all the todos
  # post "todos", to: "todos#create"           #adds a todo to the list
  # get "todos/:id", to: "todos#show"          #shows 1 todo based on para id

  resources :todos
  resources :users
end
