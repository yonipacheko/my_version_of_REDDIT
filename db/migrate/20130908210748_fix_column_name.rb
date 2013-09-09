class FixColumnName < ActiveRecord::Migration
  def change

    #rename_column :table_name, :old_column, :new_column
    rename_column :post_categories, :category, :category_id
  end
end
