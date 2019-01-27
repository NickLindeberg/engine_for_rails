class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  validates_presence_of :name


  def self.top_merchants(x)
    joins(:invoice_items, :invoices)
    .group(:id)
    .order("sum(quantity * unit_price) desc")
    .limit(x)
  end

end
