class Customer < ApplicationRecord
  belongs_to :invoice
  validates_presence_of :first_name,
                        :last_name
end
