class RenameColumnTableOnTitle < ActiveRecord::Migration[5.1]
  def change
    rename_column :purchases, :table, :title
  end
end
