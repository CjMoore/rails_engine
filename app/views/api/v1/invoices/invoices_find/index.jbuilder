json.(@invoices) do |invoice|
  json.(invoice, :id, :merchant_id, :customer_id, :status)
end
