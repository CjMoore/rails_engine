json.(@invoice_items) do |invoice_item|
  json.(invoice_item, :id, :invoice_id, :item_id, :unit_price, :quantity)
end
