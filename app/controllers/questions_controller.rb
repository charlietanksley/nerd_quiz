require 'json'
class QuestionsController < ApplicationController
  respond_to :json

  def show
    render json: question
  end

  private

  def question
    "{'question':'answer'}"
  end
end
