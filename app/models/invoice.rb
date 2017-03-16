class Invoice < ApplicationRecord
  belongs_to :customer
  belongs_to :merchant

  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  validates :status, presence: true

  def total
    invoice_items.reduce(0) do |total, item|
      total += (item.unit_price * item.quantity)
    end
  end

  def successful?
    transactions.find do |transaction|
      transaction.result == "success"
    end
  end

  def date
    self.created_at
  end
end
