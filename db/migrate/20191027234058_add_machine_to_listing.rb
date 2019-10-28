class AddMachineToListing < ActiveRecord::Migration[5.2]
  def change
    add_reference :listings, :machine, foreign_key: true
  end
end
