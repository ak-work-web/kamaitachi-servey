class Topic < ApplicationRecord
  has_many :choices

  # 「親（Topic）と一緒に子（Choice）も保存する」
  accepts_nested_attributes_for :choices,
                                reject_if: :all_blank

  validates :title, presence: true
end
