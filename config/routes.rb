NerdQuiz::Application.routes.draw do
  get '/auth/stable/callback/', to: 'api/sessions#create'
  resource :sign_in, only: [:new], controller: 'sign_in'
  resource :sign_out, only: [:destroy], controller: 'sign_out'

  namespace :api do
    resource :nerd_list, only: [:show]
    resource :question, only: [:show]
    resource :session, only: [:show]
  end

  root 'app#show'
  match '*path', to: "app#show", via: [:get, :post]
end
