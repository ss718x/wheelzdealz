class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cars
  has_one_attached :avatar

  has_many :offers_as_seller, class_name: 'Offer', foreign_key: 'seller_id'
  has_many :offers_as_buyer, class_name: 'Offer', foreign_key: 'buyer_id'
end
