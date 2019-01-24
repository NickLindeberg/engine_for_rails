class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  validates_presence_of :status

  def self.best_day(item_id)
    Invoice.select("invoices.created_at, sum(invoice_items.quantity) AS best_day")
           .joins(:invoice_items)
           .where("invoice_items.item_id = item_id")
           .group("invoices.id")
           .order("best_day desc, invoices.created_at desc")
           .limit(1)
           .first
  end
end
