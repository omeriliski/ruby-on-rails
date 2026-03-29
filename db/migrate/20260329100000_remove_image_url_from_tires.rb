class RemoveImageUrlFromTires < ActiveRecord::Migration[7.1]
  def change
    remove_column :tires, :image_url, :string
  end
end