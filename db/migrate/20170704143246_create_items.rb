class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :row_order
      t.string :image
      t.text :description
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
