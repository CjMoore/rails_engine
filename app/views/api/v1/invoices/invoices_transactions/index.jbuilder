json.(@transactions) do |transaction|
  json.(transaction, :id, :invoice_id, :result, :credit_card_number)
end
