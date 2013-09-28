NerdQuiz::Application.routes.draw do
  root 'home#index'
  get '/auth/stable/callback/', to: 'sessions#create'

  resource :nerd_list, only: [:show]
end
