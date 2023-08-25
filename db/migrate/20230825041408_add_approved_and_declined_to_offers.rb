class AddApprovedAndDeclinedToOffers < ActiveRecord::Migration[7.0]
  def change
    add_column :offers, :approved, :boolean, default: false
    add_column :offers, :declined, :boolean, default: false
  end
end
