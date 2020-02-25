class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.references :user, foreign_key: true, null: false
      # t.references :group, foreign_key: true
      t.timestamps
    end
  end
end
