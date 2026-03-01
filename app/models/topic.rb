class Topic < ApplicationRecord
  has_many :choices

  validates :title, presence: true
end
