NerdQuiz::Application.routes.draw do
  root 'sign_in#new'
  get '/auth/stable/callback/', to: 'sessions#create'

  resource :nerd_list, only: [:show]
  resource :sign_in, only: [:new], controller: 'sign_in'
  resource :sign_out, only: [:destroy], controller: 'sign_out'
end
