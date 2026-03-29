class AddListPriceToTires < ActiveRecord::Migration[7.1]
  def change
    add_column :tires, :list_price, :float
  end
end
