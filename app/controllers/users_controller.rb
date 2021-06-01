class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "List of users:\n" + Users.order(:id).map { |user| user.to_displayable_string }.join("\n")
  end

  # def show
  #   id = params[:id]
  #   todo = Todo.find(id)
  #   render plain: todo.to_pleasant_string
  # end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]
    new_user = Users.create!(
      name: name,
      email: email,
      password: password,
    )
    response_text = "New user created is: #{new_user.to_displayable_string}"
    render plain: response_text
  end

  # def update
  #   id = params[:id]
  #   completed = params[:completed]
  #   todo = Todo.find(id)
  #   todo.completed = completed
  #   todo.save
  #   render plain: "Updated todo status to #{completed} "
  # end
end
