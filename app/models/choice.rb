class Choice < ApplicationRecord
  #ChoiceテーブルがTopicテーブルの子
  belongs_to :topic

  #ChoiceテーブルがVoteテーブルの親
  has_many :votes
end
