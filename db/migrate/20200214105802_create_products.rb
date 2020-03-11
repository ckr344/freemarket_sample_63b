class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description
      t.integer :status, default: 0, null: false, limit: 1
      t.integer :delivery_charge, default: 0, limit: 1
      t.integer :delivery_method, default: 0, null: false, limit: 1
      t.integer :delivery_prefecture, default: 0, null: false, limit: 1
      t.integer :delivery_days, default: 0, null: false, limit: 1
      t.integer :size, default: 0, null: false, limit: 1
      t.string :brand
      t.integer :price, null: false
      t.integer :transaction_id
      t.integer :category
      # t.integer :main_category_id
      # t.integer :second_category_id
      # t.integer :third_category_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end