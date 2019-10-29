class RemoveTypeFromMachines < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :type, :string
  end
end
