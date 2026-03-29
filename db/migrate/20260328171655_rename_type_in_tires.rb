class RenameTypeInTires < ActiveRecord::Migration[7.1]
  def change
    rename_column :tires, :type, :season
  end
end
