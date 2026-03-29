class RenameHeightInTires2 < ActiveRecord::Migration[7.1]
  def change
    rename_column :tires, :hight, :height
  end
end
