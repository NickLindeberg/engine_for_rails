class InvoiceItemsInvoiceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :quantity, :unit_price, :item_id, :invoice_id
  belongs_to :invoice
end
