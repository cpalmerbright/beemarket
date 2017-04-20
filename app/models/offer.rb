class Offer < ApplicationRecord
  belongs_to :buyer
  belongs_to :listing

  def vendor
    listing.vendor
  end
end
