class CreateStockedItems < ActiveRecord::Migration[5.1]
  def change
    create_table :stocked_items do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :count, default: 0

      t.timestamps
    end
  end
end
