class UpdateOffers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :offers, :seller, index: true, foreign_key: { to_table: :users }
    remove_column :offers, :car_make, :string
    remove_column :offers, :car_model, :string
    remove_column :offers, :year, :integer
    remove_column :offers, :price, :decimal
    remove_column :offers, :description, :text
    remove_column :offers, :sold, :boolean
    add_reference :offers, :car, foreign_key: true
  end
end
