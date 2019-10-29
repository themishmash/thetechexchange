class RemoveYearFromYears < ActiveRecord::Migration[5.2]
  def change
    remove_column :years, :year, :integer
  end
end
