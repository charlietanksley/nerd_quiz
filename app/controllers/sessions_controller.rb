class SessionsController < ApplicationController
  def create
    registrar = Registar.new(request.env['omniauth.auth'])
    registrar.establish_user
  end

  Registrar = Struct.new(:auth) do
    def establish_user
      user = User.find_or_initialize_by(info.fetch(:email))
      user.name = info.fetch(:full_name)

      establish_authentication(user)

      user.save!
    end

    private

    def credentials
      @credentials ||= auth[:credentials]
    end

    def establish_authentication(user)
      user.build_stable_authentication(refresh_token: auth.fetch(:refresh_token),
        token: auth.fetch(:token),
        uid: auth.fetch(:uid),
    end

    def info
      @info ||= auth[:info]
    end
  end
end
