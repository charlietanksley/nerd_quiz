require Rails.root.join('lib', 'question')

class Api::QuestionsController < ApiController
  respond_to :json

  def show
    render json: question
  end

  private

  def question
    Question.new(Object.new).to_json
  end
end
