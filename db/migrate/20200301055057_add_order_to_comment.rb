class AddOrderToComment < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :order, :integer
  end
end
