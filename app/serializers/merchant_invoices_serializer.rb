class MerchantInvoicesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :invoices
end
