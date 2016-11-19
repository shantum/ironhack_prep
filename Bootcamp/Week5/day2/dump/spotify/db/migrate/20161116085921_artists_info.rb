class ArtistsInfo < ActiveRecord::Migration[5.0]
  def change
    add_column :name, :image_path
  end
end
