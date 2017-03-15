class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, presence: true

  def self.with_most_revenue(count)
    joins(invoices: [:transactions, :invoice_items]).merge(Transaction.where(result: "success")).group(:id).select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue").order("revenue DESC").limit(count)
  end
end
