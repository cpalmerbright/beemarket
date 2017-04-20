class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :buyer, foreign_key: true
      t.references :listing, foreign_key: true
      t.integer :amount
      t.boolean :accepted

      t.timestamps
    end
  end
end
