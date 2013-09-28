class SignOutController < ApplicationController
  skip_before_action :authenticate!

  def destroy
    reset_session
    redirect_to root_path
  end
end
