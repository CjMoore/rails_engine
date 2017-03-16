json.(@transactions) do |transaction|
  json.(transaction, :id)
end
