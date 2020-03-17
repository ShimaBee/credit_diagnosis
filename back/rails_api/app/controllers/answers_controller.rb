class AnswersController < ApplicationController

  def answers
    # ユーザが選んだ選択肢を受け取る。
    choices = params[:choices]
    # yamlの質問と選択肢を全て持ってくる。
    questions = YAML.load_file("public/questions.yml")
    # ユーザの選んだ選択肢(index)が持つ値を入れる配列を作る。
    taste_values = []
    # ユーザが選んだ選択肢の趣向値をyamlから取って、配列に入れる。
    questions.each_with_index do |question, index|
      taste_values << question["values"][params[:choices][index]]
    end
    # 趣向値をだけを配列に入れる
    user_taste_values = []
    taste_values.each do |v|
      user_taste_values.push(v.values)
    end
    # 配列の中に配列が入っている状態だったので、平坦にする。
    user_taste_values.flatten!
    # 全てのカードのage, points, miles, annual_feeの値を配列にいれる。
    cards_compared_values_array = Card.pluck(:age, :points, :miles, :annual_fee)
    # |趣向値 - カードの値| この計算を全カード分行う。
    different_values = []
    cards_compared_values_array.each do |c|
      different_values << [user_taste_values, c].transpose.map{|a| a.inject(:-).abs }
    end
    # アンマッチ度の算出(arrayの中の足し算)
    arrays_sum = []
    different_values.each do |diff|
      arrays_sum.push << diff.sum.round(2)
    end
    # アンマッチ度にindexをつけて、hash化する。
    sums_with_id = {}
    arrays_sum.each_with_index do |sum,index|
      sums_with_id.merge!(index+1 => sum)
    end
    # アンマッチ度をもとにマッチしている順番に並べる。
    much_index = sums_with_id.sort_by { |_, v| v }.to_h
    # マッチしている上位三つのindexを取得する。
    much_cards_index = much_index.keys.take(3)
    # マッチしている上位三つのindexをもとに、BDからCardを引っ張る。
    cards = Card.where(id: much_cards_index)
    # Nuxt側にjson形式でマッチしたcardの情報を返す。
    render json: cards, status: 200
  end

end
