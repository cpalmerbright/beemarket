require 'action_view'
include ActionView::Helpers::DateHelper

class Listing < ApplicationRecord
  belongs_to :vendor
  has_many :offers
  has_many :buyers, through: :offers
  validates :quantity, presence: true, :numericality =>  {:greater_than => 0}

  def expired?
    time_elapsed >= 7*24*60*60
  end

  def time_elapsed
    Time.now.utc - created_at
  end

  def time_remaining
    distance_of_time_in_words(7*24*60*60 - time_elapsed)
  end
end
