class AnswersController < ApplicationController

  def answers
    choices = params[:choices]
    render json: choices, status: 200
  end
end
