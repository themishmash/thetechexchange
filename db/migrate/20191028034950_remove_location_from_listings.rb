class RemoveLocationFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_reference :listings, :location, foreign_key: true
  end
end
