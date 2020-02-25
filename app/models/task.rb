class Task < ApplicationRecord
  belongs_to :user
  # belongs_to :group

  validates :title, length: {in: 1..255}
end
