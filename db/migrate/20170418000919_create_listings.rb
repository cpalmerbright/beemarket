class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :vendor, foreign_key: true, null: false
      t.integer :quantity
      t.string :species

      t.timestamps
    end
  end
end
