class Car < ApplicationRecord
  belongs_to :seller, class_name: 'User'
  has_many :offers, dependent: :destroy
end
