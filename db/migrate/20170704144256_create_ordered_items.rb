class CreateOrderedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ordered_items do |t|
      t.references :order_history, foreign_key: true
      t.references :item, foreign_key: true
      t.string :name
      t.integer :price
      t.string :image
      t.integer :count

      t.timestamps
    end
  end
end
