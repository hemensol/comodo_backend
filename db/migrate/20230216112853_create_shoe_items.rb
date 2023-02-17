class CreateShoeItems < ActiveRecord::Migration[7.0]
  def change
    create_table :shoe_items do |t|
      t.integer :size, null: false
      t.integer :amount, null: false
      t.references :shoe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
