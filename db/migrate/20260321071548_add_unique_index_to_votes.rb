class AddUniqueIndexToVotes < ActiveRecord::Migration[7.0]
  def change
    # user_id と topic_id の組み合わせにユニーク（重複禁止）制約をかける
    add_index :votes, [:user_id, :topic_id], unique: true
  end
end
