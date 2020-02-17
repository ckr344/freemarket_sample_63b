class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :product_id
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
