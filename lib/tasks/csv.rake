require 'csv'

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

namespace :csv do
  desc "imports csvs"
  task :import => :environment do
    seed_customers
    seed_merchants
    seed_invoices
    seed_transactions
    seed_items
    seed_invoice_items
  end
end
