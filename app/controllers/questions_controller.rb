require Rails.root.join('lib', 'question')

class QuestionsController < ApplicationController
  respond_to :json

  def show
    render json: question
  end

  private

  def question
    Question.new(current_user).to_json
  end
end
