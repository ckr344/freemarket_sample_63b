class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.integer :condition, default: 0, null: false, limit: 1
      t.integer :delivery_charge, default: 0, null: false, limit: 1
      t.integer :delivery_method, default: 0, null: false, limit: 1
      t.integer :delivery_prefecture, default: 0, null: false, limit: 1
      t.integer :delivery_days, default: 0, null: false, limit: 1
      t.integer :price, null: false
      t.integer :transaction_id
      t.integer :main_category_id, null: false
      t.integer :second_category_id, null: false
      t.integer :third_category_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end