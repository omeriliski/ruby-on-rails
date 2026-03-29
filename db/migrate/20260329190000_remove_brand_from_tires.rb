class RemoveBrandFromTires < ActiveRecord::Migration[7.1]
  def change
    remove_column :tires, :brand, :string
  end
end
