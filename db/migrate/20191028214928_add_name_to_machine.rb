class AddNameToMachine < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :name, :string
  end
end
