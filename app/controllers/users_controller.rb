class UsersController < ApplicationController
  def new
    render "new"
  end

  def index
    render plain: "List of users:\n" + User.all.map { |user| user.to_displayable_string }.join("\n")
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
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
