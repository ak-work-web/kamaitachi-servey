class AddUserAndTopicToVotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :votes, :user, null: false, foreign_key: true
    add_reference :votes, :topic, null: false, foreign_key: true
  end
end
