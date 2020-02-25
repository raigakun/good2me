class Task < ApplicationRecord
  belongs_to :user
  # belongs_to :group
  has_many :comments, dependent: :destroy

  validates :title, length: {in: 1..255}
end
