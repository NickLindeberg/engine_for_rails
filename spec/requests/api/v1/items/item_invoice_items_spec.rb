require 'rails_helper'

describe 'item invoice_item find' do
  it 'can find an invoice items for an item' do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    customer = create(:customer)
    invoice = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    invoice_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id)
    ii_2 = create(:invoice_item, item_id: item_1.id, invoice_id: invoice.id)
    ii_3 = create(:invoice_item, item_id: item_2.id, invoice_id: invoice_2.id)

    get "/api/v1/items/#{item_1.id}/invoice_items"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:attributes]).to have_key(:description)
    expect(data[:attributes]).to have_key(:unit_price)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(parsed[:data][:relationships][:invoice_items][:data].count).to eq(2)
    expect(parsed[:data][:relationships][:invoice_items][:data].first[:id]).to eq(ii_1.id.to_s)
    expect(parsed[:data][:relationships][:invoice_items][:data].last[:id]).to eq(ii_2.id.to_s)
    expect(parsed[:data][:relationships][:invoice_items][:data].last[:id]).to_not eq(ii_3.id.to_s)
  end
end
