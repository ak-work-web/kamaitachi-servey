class VotesController < ApplicationController
  def create
    #Choiceテーブルのどの選択肢への投票か見つける
    choice = Choice.find(params[:choice_id])

    #Choiceテーブルで見つけた選択肢に紐づく新しい投稿データ(Vote)を作る
    choice.votes.create

    #画面をアンケート一覧(root)へ戻す
    redirect_to root_path
  end
end
