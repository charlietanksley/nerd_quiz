require Rails.root.join('lib', 'nerd_repository')

class Api::SessionsController < ApiController
  skip_before_action :authenticate!
  respond_to :json

  def create
    registrar = Registrar.new(auth_hash)
    user = registrar.establish_user

    self.current_user = user
    NerdRepository.cache(user)

    redirect_to api_session_path(format: :json)
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  Registrar = Struct.new(:auth_hash) do
    def establish_user
      ActiveRecord::Base.transaction do
        user = User.find_or_initialize_by(email: info.fetch(:email))
        user.name = info.fetch(:full_name)

        establish_authentication(user)
        user.save!

        user
      end
    end

    private

    def establish_authentication(user)
      user.build_oauth_token(expires_at: credentials.fetch(:expires_at),
        refresh_token: credentials.fetch(:refresh_token),
        token: credentials.fetch(:token),
        user_id: user.id)
    end

    def credentials
      @credentials ||= auth_hash[:credentials]
    end

    def info
      @info ||= auth_hash[:info]
    end
  end
end
