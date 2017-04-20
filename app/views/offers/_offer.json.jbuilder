json.extract! offer, :id, :buyer_id, :listing_id, :amount, :accepted, :created_at, :updated_at
json.url offer_url(offer, format: :json)
