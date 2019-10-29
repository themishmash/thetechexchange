class AddNameToYear < ActiveRecord::Migration[5.2]
  def change
    add_column :years, :name, :integer
  end
end
