Fabricator(:invoice) do
  customer
  merchant
  status      "shipped"
end
