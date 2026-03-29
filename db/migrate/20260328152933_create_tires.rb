class CreateTires < ActiveRecord::Migration[7.1]
  def change
    create_table :tires do |t|
      t.string :name
      t.string :brand
      t.string :width
      t.string :hight
      t.string :inch
      t.string :type
      t.float :price
      t.integer :stock
      t.string :sku
      t.string :description
      t.string :image_url

      t.timestamps
    end
  end
end
