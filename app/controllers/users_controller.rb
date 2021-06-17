class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: "List of users:\n" + User.all.map { |user| user.to_displayable_string }.join("\n")
  end

  def create
    first_name = params[:first_name]
    last_name = params[:last_name]
    email = params[:email]
    password = params[:password_digest]
    new_user = Users.create!(
      first_name: first_name,
      last_name: last_name,
      email: email,
      password_digest: password,
    )
    response_text = "New user created is: #{new_user.to_displayable_string}"
    render plain: response_text
  end

  def login
    email = params[:email]
    password = params[:password_digest]
    user = Users.find_by(email: email)
    response_text = if user
        password == user.password ? true : false
      else
        "Error: No user with given email exists."
      end
    render plain: response_text
  end
end
