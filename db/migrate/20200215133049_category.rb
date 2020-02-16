class Category < ActiveRecord::Migration[5.2]
  def change
    has_many :items
    has_ancestry
  end
end
