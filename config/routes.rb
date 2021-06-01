Rails.application.routes.draw do
  get "todos", to: "todos#index"          #lists all the todos
  get "todos/create", to: "todos#create"  #adds a todo to the list
  get "todos/:id", to: "todos#show"       #shows 1 todo based on para id
end
