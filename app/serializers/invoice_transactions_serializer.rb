class InvoiceTransactionsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :status, :merchant_id, :customer_id
  has_many :transactions
end
