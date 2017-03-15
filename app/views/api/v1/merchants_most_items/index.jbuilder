json.(@merchants) do |merchant|
  json.items_sold merchant.total_items
end
