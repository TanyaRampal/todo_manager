class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "show all users here"
    # render plain: Users.order(:id).map { |user| user.to_displayable_string }.join("\n")
  end

  # def show
  #   id = params[:id]
  #   todo = Todo.find(id)
  #   render plain: todo.to_pleasant_string
  # end

  # def create
  #   name = params[:name]
  #   email = params[:email]
  #   password = params[:password]
  #   new_todo = Todo.create!(
  #     todo_text: todo_text,
  #     due_date: due_date,
  #     completed: false,
  #   )
  #   response_text = "Hey, new todo created is: #{new_todo.to_pleasant_string} with id: #{new_todo.id}"
  #   render plain: response_text
  # end

  # def update
  #   id = params[:id]
  #   completed = params[:completed]
  #   todo = Todo.find(id)
  #   todo.completed = completed
  #   todo.save
  #   render plain: "Updated todo status to #{completed} "
  # end
end
