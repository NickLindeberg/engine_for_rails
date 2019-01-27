class InvoiceInvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :merchant_id, :customer_id
  has_many :invoice_items
end
