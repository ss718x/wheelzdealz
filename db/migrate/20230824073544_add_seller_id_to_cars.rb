class AddSellerIdToCars < ActiveRecord::Migration[7.0]
  def change
    add_reference :cars, :seller, foreign_key: { to_table: :users }
  end
end
