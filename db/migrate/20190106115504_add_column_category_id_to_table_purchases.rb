class AddColumnCategoryIdToTablePurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :category_id, :integer
    add_index :purchases, :category_id
  end
end
