class AddAddressToCostumes < ActiveRecord::Migration[6.1]
  def change
    add_column :costumes, :address, :string
  end
end
