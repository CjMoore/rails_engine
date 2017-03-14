json.(@items) do |item|
  json.unit_price ((item.unit_price/100.00).round(2)).to_s
  json.(item, :id, :name, :description, :merchant_id)
end
