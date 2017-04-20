class Listing < ApplicationRecord
  belongs_to :vendor
  has_many :offers
  has_many :buyers, through: :offers
  validates :quantity, presence: true, :numericality =>  {:greater_than => 0}
end
