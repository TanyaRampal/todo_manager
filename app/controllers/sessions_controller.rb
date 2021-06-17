class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user
      if user.authenticate(params[:password])
        render plain: "you have successfully signed in"
      else
        render plain: "Incorrect password"
      end
    else
      render plain: "no registered user with given email "
    end
  end
end
