class CreateConditions < ActiveRecord::Migration[5.2]
  def change
    create_table :conditions do |t|
      t.integer :goods_condition

      t.timestamps
    end
  end
end
