class AddTypeToMachine < ActiveRecord::Migration[5.2]
  def change
    add_column :machines, :type, :string
  end
end
