class Offer < ApplicationRecord
  belongs_to :car
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true

  def title
    "Offer for #{car.car_model}"
  end

  def status
    if approved
      'Approved'
    elsif declined
      'Declined'
    else
      'Pending'
    end
  end
end
