class ApiController < ApplicationController
  before_filter :authenticate!

  private

  def api_token
    User.first.oauth_token.token
  end

  def authenticate!
    current_user
  end
  helper_method :authenticate!

  def current_user
    @current_user ||= User.authenticate(api_token)
    if @current_user.nil?
      render json: "{'error':'User not found'}" and return
    end

    @current_user
  end
  helper_method :current_user

  def current_user=(user)
    session[:api_token] = user.api_token
    @current_user = user
  end
end
