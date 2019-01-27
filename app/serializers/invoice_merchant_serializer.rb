class InvoiceMerchantSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :merchant_id, :customer_id
  belongs_to :merchant
end
