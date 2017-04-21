class Vendor < ApplicationRecord
  has_many :listings, dependent: :destroy
  has_many :offers, through: :listings
  validates :name, presence: true
end
