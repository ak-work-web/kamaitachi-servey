class Vote < ApplicationRecord
  belongs_to :user #投票(Vote)とユーザー(user)を繋げる。投票したユーザーが判明。
  belongs_to :choice
  belongs_to :topic #投票（Vote)とお(topic)を繋げる。投票したお題が判明。

  # 「1人のユーザーは、1つのお題に対して1回しか投票できない」というバリデーション
  validates :user_id, uniqueness: { scope: :topic_id, message: "既にこのお題に投票済みです" }

end
