class Item < ApplicationRecord
  belongs_to :merchant

  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates :name, :description, :unit_price, presence: true

  def self.with_most_revenue(count)
    joins(invoices: [:transactions, :invoice_items])
      .merge(Transaction.where(result: "success"))
      .group(:id).select("items.*, SUM(invoice_items.quantity * invoice_items.unit_price) AS revenue")
      .order("revenue DESC").limit(count)
  end

  def self.best_day(item)
    joins(invoices: [:transactions, :invoice_items])
      .merge(Transaction.success).where("items.id = ?", item.id)
      .select("invoices.created_at as best_day, sum(invoice_items.quantity * invoice_items.unit_price) as revenue")
      .group("best_day").order("revenue desc").limit(1)
  end

  def self.most_items(number)
    joins(invoice_items: [invoice: :transactions])
      .merge(Transaction.success)
      .select("items.*, SUM(invoice_items.quantity) as count")
      .group(:id)
      .order("count DESC").limit(number)
  end
end
