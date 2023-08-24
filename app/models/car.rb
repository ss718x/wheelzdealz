class Car < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_one :offer
end
