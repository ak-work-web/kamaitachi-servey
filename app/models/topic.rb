class Topic < ApplicationRecord

  belongs_to :user
  has_many :choices, dependent: :destroy

  #お題が消えたら、そのお題に関連する「投票」もすべて削除する
  has_many :votes, through: :choices, dependent: :destroy

  def voted_by?(user)
    return false unless user
    # 選択肢を介して、そのユーザーの投票が存在するかチェック
    votes.where(user_id: user.id).exists?
  end

  # 「親（Topic）と一緒に子（Choice）も保存する」
  accepts_nested_attributes_for :choices,
                                reject_if: :all_blank

  validates :title, presence: true
end
