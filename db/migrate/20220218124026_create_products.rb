class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.bigint :upc, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :price, null: false, precision: 8, scale: 2
      t.decimal :weight, precision: 6, scale: 2
      t.string :weight_unit

      t.timestamps
    end

    execute 'SELECT setval('products_id_seq', 1000)'

    add_index :products, :title
    add_index :products, :upc, unique: true
  end
end
