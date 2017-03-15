class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :transactions, through: :invoices

  validates :name, presence: true

  def self.get_favorite_customer(merchant)
    Customer.find(Customer.joins(:transactions, :invoices).where("invoices.merchant_id = ? and result = ?", merchant.id, "success").select("customers.*, invoices.customer_id, transactions.result").group("invoices.customer_id").order("count_id DESC").count('id').first.first)
  end
  
end
