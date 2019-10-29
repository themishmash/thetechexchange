class AddConditionToConditions < ActiveRecord::Migration[5.2]
  def change
    add_column :conditions, :condition, :string
  end
end
