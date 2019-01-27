require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it { should have_many(:items)}
  end

  describe 'class methods' do
    it '#top_merchants' do
      customer = create(:customer)
      merc_1 = create(:merchant, name: "top")
      merc_2 = create(:merchant, name: "second")
      merc_3 = create(:merchant, name: "loser")
      inv_1 = create(:invoice, merchant_id: merc_1.id, customer_id: customer.id)
      inv_2 = create(:invoice, merchant_id: merc_2.id, customer_id: customer.id)
      inv_3 = create(:invoice, merchant_id: merc_3.id, customer_id: customer.id)
      item_1 = create(:item, merchant_id: merc_1.id)
      item_2 = create(:item, merchant_id: merc_2.id)
      item_3 = create(:item, merchant_id: merc_3.id)
      ii_1 = create(:invoice_item, item_id: item_1.id, invoice_id: inv_1.id, quantity: 3, unit_price: 3)
      ii_1 = create(:invoice_item, item_id: item_2.id, invoice_id: inv_2.id, quantity: 2, unit_price: 2)
      ii_1 = create(:invoice_item, item_id: item_3.id, invoice_id: inv_3.id, quantity: 1, unit_price: 1)

      top_mercs = Merchant.top_merchants(2)
      expect(top_mercs[0]).to eq(merc_1)
      expect(top_mercs.last).to eq(merc_2)
      expect(top_mercs.last).to_not eq(merc_3)
      expect(top_mercs.length).to eq(2)
    end
  end
end
