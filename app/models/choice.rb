class Choice < ApplicationRecord
  #ChoiceテーブルがTopicテーブルの子
  belongs_to :topic

  #ChoiceテーブルがVoteテーブルの親
  has_many :votes, dependent: :destroy

  # このメソッドを追記：得票率（％）を計算する
  def vote_percentage
    # お題全体の総得票数を取得
    total_votes = topic.choices.sum { |c| c.votes.count }
    
    # 0除算（エラー）を防ぐ
    return 0 if total_votes == 0
    
    # (自分の票数 / 全体の票数) * 100 を小数点第一位で四捨五入
    ((votes.count.to_f / total_votes) * 100).round(1)
  end
end
