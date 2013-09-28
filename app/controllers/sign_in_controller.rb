class SignInController < ApplicationController
  skip_before_action :authenticate!

  def new
  end
end
