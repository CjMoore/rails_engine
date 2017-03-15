class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  validates :name, presence: true

  def self.get_favorite_customer(merchant)
    Customer.find(Customer.joins(:transactions, :invoices).where("invoices.merchant_id = ? and result = ?", merchant.id, "success").select("customers.*, invoices.customer_id, transactions.result").group("invoices.customer_id").order("count_id DESC").count('id').first.first)
  end

  def total_revenue(date=nil)
    if date
      invoices_by_date(date).reduce(0) do |total, invoice|
        total += invoice.total
      end
    else
      invoices.select(&:successful?).reduce(0) do |total, invoice|
        total += invoice.total
      end
    end
  end

  def self.with_invoices
    includes(invoices: [:invoice_items, :transactions])
  end

  def invoices_by_date(date)
    invoices.select(&:successful?).select do |invoice|
      DateTime.parse(date) == invoice.date
    end
  end

  def self.most_items(number)
    joins(:invoice_items).group("merchants.id")
      .select("merchants.*, SUM(invoice_items.quantity) as total_items")
      .order("total_items DESC").limit(number)
  end

end
