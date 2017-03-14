require "csv"

require_relative "../app/models/customer"
require_relative "../app/models/invoice_item"
require_relative "../app/models/invoice"
require_relative "../app/models/item"
require_relative "../app/models/merchant"
require_relative "../app/models/customer"

def seed_customers
  CSV.foreach("db/csv/customers.csv", headers: true, header_converters: :symbol) do |row|
    Customer.create(row.to_h)
  end
  puts "customers seeded"
end

def seed_merchants
  CSV.foreach("db/csv/merchants.csv", headers: true, header_converters: :symbol) do |row|
    Merchant.create(row.to_h)
  end
  puts "merchants seeded"
end

def seed_invoices
  CSV.foreach("db/csv/invoices.csv", headers: true, header_converters: :symbol) do |row|
    Invoice.create(row.to_h)
  end
  puts "invoices seeded"
end

def seed_transactions
  CSV.foreach("db/csv/transactions.csv", headers: true, header_converters: :symbol) do |row|
    Transaction.create(invoice_id: row[:invoice_id],
                   credit_card_number: row[:credit_card_number],
                   result: row[:result],
                   created_at: row[:created_at],
                   updated_at: row[:updated_at])
  end
  puts "transactions seeded"
end

def seed_items
  CSV.foreach("db/csv/items.csv", headers: true, header_converters: :symbol) do |row|
    Item.create(row.to_h)
  end
  puts "items seeded"
end

def seed_invoice_items
  CSV.foreach("db/csv/invoice_items.csv", headers: true, header_converters: :symbol) do |row|
    InvoiceItem.create(row.to_h)
  end
  puts "invoice items seeded"
end

InvoiceItem.destroy_all
Item.destroy_all
Transaction.destroy_all
Invoice.destroy_all
Customer.destroy_all
Merchant.destroy_all

seed_customers
seed_merchants
seed_invoices
seed_transactions
seed_items
seed_invoice_items
