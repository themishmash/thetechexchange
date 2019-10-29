class RemoveGoodsConditionFromConditions < ActiveRecord::Migration[5.2]
  def change
    remove_column :conditions, :goods_condition, :integer
  end
end
