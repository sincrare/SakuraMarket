class CreateOrderHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :order_histories do |t|
      t.references :user, foreign_key: true
      t.datetime :delivery_date_from
      t.datetime :delivery_date_to
      t.integer :total_amount
      t.integer :cod_fee
      t.integer :shipping
      t.integer :sales_tax
      t.integer :billing_amount

      t.timestamps
    end
  end
end
