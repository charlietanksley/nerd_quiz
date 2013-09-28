class ApplicationController < ActionController::Base
  NoCurrentUser = Module.new

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def authenticate!
    current_user
  rescue NoCurrentUser
    redirect_to new_session_path
  end
  helper_method :authenticate!

  def current_user
    @current_user ||= User.find(session[:user_id].to_s)
  rescue ActiveRecord::RecordNotFound => e
    e.extend(NoCurrentUser)
    raise
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end
end
