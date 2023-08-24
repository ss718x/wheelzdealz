class CreateOffers < ActiveRecord::Migration[7.0]
  def change
    create_table :offers do |t|
      t.references :seller, null: false, foreign_key: { to_table: :users }
      t.references :buyer, null: true, foreign_key: { to_table: :users }
      t.string :car_make
      t.string :car_model
      t.integer :year
      t.decimal :price
      t.text :description
      t.boolean :sold

      t.timestamps
    end
  end
end
