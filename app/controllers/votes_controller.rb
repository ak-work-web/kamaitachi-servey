class VotesController < ApplicationController
  def create
    #Choiceテーブルのどの選択肢への投票か見つける
    choice = Choice.find(params[:choice_id])

    # １. 「お題」に対して「自分」が既に投票しているか探し、なければ新しく準備する
    # ここで「誰が(current_user)」「どのお題に(choice.topic)」をセットする
    vote = Vote.find_or_initialize_by(
    user: current_user,
    topic: choice.topic
    )

    # 2. 選択肢を「今回選んだもの」に上書き（新規の場合もここでセットされる）
    vote.choice = choice

    #３.保存処理。画面をアンケート一覧(root)へ戻す
    if vote.save
      # 成功したら一覧へ
      redirect_to root_path, notice: "投票しました！"
    else
      # 失敗（重複など）したら一覧へ戻し、メッセージを表示
      redirect_to root_path, alert: vote.errors.full_messages.to_sentence
    end

  end
end
