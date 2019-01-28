class Item < ApplicationRecord
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  validates_presence_of :name,
                        :description,
                        :unit_price

  def self.top_rev_items(x)
    x = joins(:invoice_items)
    .group(:id)
    .order("sum(invoice_items.quantity * invoice_items.unit_price) desc")
    .limit(x)
  end

end
