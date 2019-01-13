class RenameTablePurchasesToProducts < ActiveRecord::Migration[5.1]
  def change
    rename_table :purchases, :products
    rename_column :taggings, :purchase_id, :product_id
  end
end
