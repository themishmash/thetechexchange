class RemoveTechFromMachines < ActiveRecord::Migration[5.2]
  def change
    remove_column :machines, :tech, :integer
  end
end
