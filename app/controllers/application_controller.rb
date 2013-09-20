class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
    @current_user ||= User.find(session[:user_id].to_s)
  rescue
    NullUser.new
  end
  helper_method :current_user

  def current_user=(user)
    session[:user_id] = user.id
    @current_user = user
  end

  class NullUser
    def name
      ''
    end
  end
end
