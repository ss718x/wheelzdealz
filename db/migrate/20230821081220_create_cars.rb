class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :car_model
      t.string :car_info
      t.integer :car_price
      t.boolean :offer_status

      t.timestamps
    end
  end
end
