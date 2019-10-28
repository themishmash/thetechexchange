class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.text :description
      t.references :system, foreign_key: true
      t.references :year, foreign_key: true
      t.references :condition, foreign_key: true
      t.references :location, foreign_key: true
      t.boolean :data_wiped
      t.integer :is_donated

      t.timestamps
    end
  end
end
