class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage, default: 800
      t.integer :total_fee
      t.integer :payment_method
      t.string :name
      t.string :postal_code
      t.string :address
      t.integer :status

      t.timestamps
    end
  end
end
