class Comment < ApplicationRecord
  include RankedModel
  ranks :row_order, with_same: :task_id
  
  belongs_to :task

  validates :title, length: { in: 1..255 }
  validates :memo,  length: { in: 1..255 }
end
