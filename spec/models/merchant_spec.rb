require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name)}
  end

  describe 'relationships' do
    it { should have_many(:items)}
  end

  describe 'class methods' do
    it '#top_rev_merchants' do
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
      ii_2 = create(:invoice_item, item_id: item_2.id, invoice_id: inv_2.id, quantity: 2, unit_price: 2)
      ii_3 = create(:invoice_item, item_id: item_3.id, invoice_id: inv_3.id, quantity: 1, unit_price: 1)

      top_mercs = Merchant.top_rev_merchants(2)
      expect(top_mercs[0]).to eq(merc_1)
      expect(top_mercs.last).to eq(merc_2)
      expect(top_mercs.last).to_not eq(merc_3)
      expect(top_mercs.length).to eq(2)
    end

    it '#top_item_merchants' do
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
      ii_2 = create(:invoice_item, item_id: item_2.id, invoice_id: inv_2.id, quantity: 2, unit_price: 2)
      ii_3 = create(:invoice_item, item_id: item_3.id, invoice_id: inv_3.id, quantity: 1, unit_price: 1)

      top_mercs = Merchant.top_item_merchants(2)
      expect(top_mercs[0]).to eq(merc_1)
      expect(top_mercs.last).to eq(merc_2)
      expect(top_mercs.last).to_not eq(merc_3)
      expect(top_mercs.length).to eq(2)
    end

    it '#total_date_rev' do
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
      ii_1 = create(:invoice_item, item_id: item_1.id, invoice_id: inv_1.id, quantity: 3, unit_price: 3, created_at: "2012-03-27 14:54:09 UTC")
      ii_2 = create(:invoice_item, item_id: item_2.id, invoice_id: inv_2.id, quantity: 2, unit_price: 2, created_at: "2012-03-27 14:54:09 UTC")
      ii_3 = create(:invoice_item, item_id: item_3.id, invoice_id: inv_3.id, quantity: 1, unit_price: 1, created_at: "2018-08-08 14:54:09 UTC")

      revenue = Merchant.total_date_rev("2012-03-27 14:54:09 UTC")
      expect(revenue).to eq(13)
    end
  end

  describe 'instance methods' do
    # it '.total_rev_for_transaction' do
    #   customer = create(:customer)
    #   merc_1 = create(:merchant)
    #   inv_1 = create(:invoice, merchant_id: merc_1.id, customer_id: customer.id)
    #   inv_2 = create(:invoice, merchant_id: merc_1.id, customer_id: customer.id)
    #   item_1 = create(:item, merchant_id: merc_1.id)
    #   ii_1 = create(:invoice_item, item_id: item_1.id, invoice_id: inv_1.id, quantity: 3, unit_price: 3)
    #   ii_3 = create(:invoice_item, item_id: item_1.id, invoice_id: inv_2.id, quantity: 1, unit_price: 1)
    #   tran_1 = create(:transaction, invoice_id: inv_1.id, result: "success")
    #   tran_3 = create(:transaction, invoice_id: inv_2.id, result: "failed")
    #
    #   revenue = merc_1.total_rev_for_transaction
    #   expect(revenue).to eq(9)
    # end
  end
end
