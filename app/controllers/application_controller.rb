class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :authenticate!

  private

  def authenticate!
    current_user
  end
  helper_method :authenticate!

  def current_user
    @current_user ||= User.find(session[:user_id].to_s)
  rescue ActiveRecord::RecordNotFound => e
    redirect_to new_sign_in_path
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end
end
