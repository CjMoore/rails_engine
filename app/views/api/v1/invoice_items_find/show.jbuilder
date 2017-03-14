json.unit_price ((@invoice_item.unit_price/100.00).round(2)).to_s
json.(@invoice_item, :item_id, :invoice_id, :id, :quantity)
