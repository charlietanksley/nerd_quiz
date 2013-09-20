class SessionsController < ApplicationController
  def create
    registrar = Registrar.new(request.env['omniauth.auth'])
    user = registrar.establish_user

    self.current_user = user

    redirect_to root_path
  end

  Registrar = Struct.new(:auth) do
    def establish_user
      ActiveRecord::Base.transaction do
        user = User.find_or_initialize_by(email: info.fetch(:email))
        user.name = info.fetch(:full_name)
        user.save!

        establish_authentication(user)

        user
      end
    end

    private

    def credentials
      @credentials ||= auth[:credentials]
    end

    def establish_authentication(user)
      StableAuthentication.new(refresh_token: credentials.fetch(:refresh_token),
        token: credentials.fetch(:token),
        user_id: user.id,
        uid: auth.fetch(:uid))
    end

    def info
      @info ||= auth[:info]
    end
  end
end
