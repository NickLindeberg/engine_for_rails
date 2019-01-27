class Merchant < ApplicationRecord
  has_many :items
  has_many :invoices
  has_many :invoice_items, through: :invoices
  validates_presence_of :name


  def self.top_rev_merchants(x)
    joins(:invoice_items, :invoices)
    .group(:id)
    .order("sum(quantity * unit_price) desc")
    .limit(x)
  end

  def self.top_item_merchants(x)
    joins(:invoice_items, :invoices)
    .group(:id)
    .order("sum(quantity) desc")
    .limit(x)
  end

  def self.total_date_rev(date)
    joins(:invoice_items, :invoices)
    .where(invoice_items: {created_at: date})
    .sum("quantity * unit_price")
  end
end
