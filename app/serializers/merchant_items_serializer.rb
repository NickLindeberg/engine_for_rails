class MerchantItemsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name
  has_many :items
end
