class Buyer < ApplicationRecord
  has_many :offers
  has_many :listings, through: :offers
end
