class InvoiceItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :merchant_id, :customer_id
  has_many :items
end
