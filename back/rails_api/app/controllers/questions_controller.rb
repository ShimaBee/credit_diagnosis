class QuestionsController < ApplicationController
  def index
    card_questions = YAML.load_file("public/questions.yml")
    render json: card_questions, status: 200
  end
end
