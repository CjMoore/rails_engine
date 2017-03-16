json.(@merchants) do |merchant|
  json.id merchant.id
  json.name merchant.name
  json.items_sold merchant.total_items
end
