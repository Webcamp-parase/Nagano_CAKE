class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :category_id
      t.integer :non_tax_price
      t.text :image_id
      t.boolean :status

      t.timestamps
    end
  end
end
