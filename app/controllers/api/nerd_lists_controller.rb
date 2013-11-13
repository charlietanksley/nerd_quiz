require Rails.root.join('lib', 'nerd_repository')
require Rails.root.join('lib', 'access_token_builder')

class Api::NerdListsController < ApiController
  respond_to :json
  def show
  end

  private

  def nerds
    access_token = AccessTokenBuilder.build(current_user)
    NerdRepository.new(access_token).all
  end
  helper_method :nerds
end
