Fabricator(:invoice) do
  customer
  merchant
  status      "shipped"
  transactions(count: 1)
end
