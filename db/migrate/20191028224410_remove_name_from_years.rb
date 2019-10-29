class RemoveNameFromYears < ActiveRecord::Migration[5.2]
  def change
    remove_column :years, :name, :date
  end
end
