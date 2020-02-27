class Task < ApplicationRecord
  # belongs_to :group
  belongs_to :user
  # belongs_to :groups
  has_many :comments, dependent: :destroy

  validates :title, length: {in: 1..255}
end
