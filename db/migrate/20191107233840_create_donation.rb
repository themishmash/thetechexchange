class CreateDonation < ActiveRecord::Migration[5.2]
  def change
    create_table :donations do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
