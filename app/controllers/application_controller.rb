class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def confirm_logged_in
    unless session[:user_id]
      redirect_to login_path, alert: "Please log in"
    end
  end

   # Stop a logged in user from going to the sign up page
  def prevent_login_signup
    if session[:user_id]
      redirect_to :back, notice: "You are already logged in"
      # what do you think redirect_to :back does?
    end
  end






end
