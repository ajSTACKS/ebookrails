class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
  	rename_column :sales, :sales, :state
  end
end
