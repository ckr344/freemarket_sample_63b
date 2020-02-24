class AddAncestryToMaincategory < ActiveRecord::Migration[5.2]
  def change
    add_column :maincategories, :ancestry, :string
    add_index :maincategories, :ancestry
  end
end
