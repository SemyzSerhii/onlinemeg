class AddColumnTablePurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :table, :string
    add_column :purchases, :price, :integer
    add_column :purchases, :short_description, :string
    add_column :purchases, :full_description, :text
    add_column :purchases, :in_stock, :boolean
  end
end
