class VotesController < ApplicationController
  def create
    #Choiceテーブルのどの選択肢への投票か見つける
    choice = Choice.find(params[:choice_id])

    # 2. その選択肢に紐づく新しい投票データを作る
    # ここで「誰が(current_user)」「どのお題に(choice.topic)」をセットする
    vote = choice.votes.build(
    user: current_user,
    topic: choice.topic
    )

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
