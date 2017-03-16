json.(@items) do |item|
  json.(item, :id, :merchant_id, :description, :name, :unit_price)
end
