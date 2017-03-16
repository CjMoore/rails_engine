json.(@items) do |item|
  json.(item, :id, :unit_price, :name, :description, :merchant_id)
end
