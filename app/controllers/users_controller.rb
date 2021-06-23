class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    user = User.find_by(email: params[:email])

    # chack if user already exists in db
    if user
      flash[:error] = "Account already exists with given email."
      redirect_to new_user_path
    else
      new_user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: params[:email],
        password: params[:password],
      )
      # give a success message (in homepage) if account is created else give flash error
      if new_user.save
        greeting = "Good " + if Time.now.hour < 12
          "Morning"
        elsif Time.now.hour > 12 && Time.now.hour < 17
          "Afternoon"
        else
          "Evening"
        end
        flash[:welcome] = "#{greeting}, #{new_user.first_name.capitalize} #{new_user.last_name.capitalize} :)"
        flash[:notice] = "You have successfully created a new account."
        session[:current_user_id] = new_user.id
        redirect_to "/"
      else
        flash[:error] = new_user.errors.full_messages.join(", ")
        redirect_to new_user_path
      end
    end
  end
end
