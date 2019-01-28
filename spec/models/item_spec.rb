require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:unit_price)}
  end

  describe 'relationships' do
    it { should belong_to(:merchant)}
  end

  describe 'class methods' do
    it '#top_rev_items' do
      merchant = create(:merchant)
      customer = create(:customer)
      item_1 = create(:item, merchant_id: merchant.id, name: "Top")
      item_2 = create(:item, merchant_id: merchant.id, name: "Second")
      item_3 = create(:item, merchant_id: merchant.id, name: "Loser")

      inv_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      inv_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
      inv_3 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)

      ii_1 = create(:invoice_item, invoice_id: inv_1.id, item_id: item_1.id, quantity: 1, unit_price: 3)
      ii_2 = create(:invoice_item, invoice_id: inv_2.id, item_id: item_2.id, quantity: 1, unit_price: 2)
      ii_3 = create(:invoice_item, invoice_id: inv_3.id, item_id: item_3.id, quantity: 1, unit_price: 1)

      top_items = Item.top_rev_items(2)
      expect(top_items[0]).to eq(item_1)
      expect(top_items.last).to eq(item_2)
      expect(top_items.last).to_not eq(item_3)
      expect(top_items.length).to eq(2)
    end
  end
end
