class AddRowOrderToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :row_order, :integer
  end
end
