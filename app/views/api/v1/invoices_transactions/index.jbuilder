json.(@transactions) do |transaction|
  json.(transaction, :id, :invoice_id, :result)
end
