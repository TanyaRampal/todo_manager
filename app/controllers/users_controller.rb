class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "List of users:\n" + Users.order(:id).map { |user| user.to_displayable_string }.join("\n")
  end

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

  def login
    email = params[:email]
    password = params[:password]
    user = Users.find_by(email: email)
    if user
      if password == user.password
        response_text = true
      else
        response_text = false
      end
    else
      response_text = "Error: No user with given email exists."
    end
    render plain: response_text
  end
end
