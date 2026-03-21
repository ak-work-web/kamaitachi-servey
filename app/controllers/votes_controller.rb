class VotesController < ApplicationController
  def create
    #Choiceテーブルのどの選択肢への投票か見つける
    choice = Choice.find(params[:choice_id])

    # 1. ログインユーザーに紐付いた新しい投票オブジェクトを作成
    # current_user.votes.new を使うことで、user_id は自動でセットされます
    vote = current_user.votes.new(
      choice: choice,      # どの選択肢か
      topic: choice.topic  # どのお題か
    )

    #2.保存処理。画面をアンケート一覧(root)へ戻す
    if vote.save
      # 成功したら一覧へ
      redirect_to root_path, notice: "投票しました！"
    else
      # 失敗（重複など）したら一覧へ戻し、メッセージを表示
      redirect_to root_path, alert: vote.errors.full_messages.to_sentence
    end

  end
end
