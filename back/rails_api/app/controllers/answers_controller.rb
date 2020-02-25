class AnswersController < ApplicationController

  def answers
    choices = params[:choices]
    five_times__choices = choices.map{|n| n * 5}
    render json: five_times__choices, status: 200
  end
end
