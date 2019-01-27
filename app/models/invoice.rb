class Invoice < ApplicationRecord
  belongs_to :merchant
  belongs_to :customer
  has_many :invoice_items
  has_many :transactions
  has_many :items, through: :invoice_items

  validates_presence_of :status
  # 
  # scope :successful_invoices, -> { joins(:transactions).where("transactions.result = 'successful'") }

  def self.best_day(item_id)
    Invoice.select("invoices.created_at, sum(invoice_items.quantity) AS best_day")
           .joins(:invoice_items)
           .where("invoice_items.item_id = item_id")
           .group("invoices.id")
           .order("best_day desc, invoices.created_at desc")
           .limit(1)
           .first
  end



  # def self.successful
  #   joins(:transactions)
  #     .where("transactions.result = 'successful'")
  # end

end
