class AnswersController < ApplicationController

  def answers
    # ユーザが選んだ選択肢を受け取る
    choices = params[:choices]

    # ユーザから受け取った選択肢の持つ値をyamlから取得する
    questions = YAML.load_file("public/questions.yml")
    answer_results = []
    questions.each_with_index do |question, index|
      answer_results << question["values"][params[:choices][index]]
    end

    render json: choices, status: 200
  end
end
