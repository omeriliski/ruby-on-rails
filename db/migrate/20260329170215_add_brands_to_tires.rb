class AddBrandsToTires < ActiveRecord::Migration[7.1]
  def change
    add_reference :tires, :brand, null: false, foreign_key: true
  end
end
