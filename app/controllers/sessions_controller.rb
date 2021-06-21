class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    user = User.find_by(email: params[:email])

    if user
      # give a welcome message (in /todos) if account is signed-in else give flash error
      if user.authenticate(params[:password])
        greeting = "Good " + if Time.now.hour < 12
          "Morning"
        elsif Time.now.hour > 12 && Time.now.hour < 17
          "Afternoon"
        else
          "Evening"
        end
        flash[:welcome] = "#{greeting}, #{user.first_name.capitalize} #{user.last_name.capitalize} :)"
        session[:current_user_id] = user.id
        redirect_to "/"
      else
        flash[:error] = "Password of '#{user.email}' is incorrect. Please retry."
        redirect_to new_sessions_path
      end
    else
      if params[:email] == ""
        flash[:error] = "Please enter your email-id"
      else
        flash[:error] = "No account with user-email '#{params[:email]}' exists. Please retry."
      end
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    # give sign-out success message in homepage(index)
    flash[:notice] = "You have successfully signed out."
    @current_user = nil
    redirect_to "/"
  end
end
