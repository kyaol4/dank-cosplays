class AddImageToCostumes < ActiveRecord::Migration[6.1]
  def change
    add_column :costumes, :image_url, :string
  end
end
