require 'rails_helper'

describe 'invoice item request' do
  it 'finds invoices items' do
    customer = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, invoice_id: inv_1.id, item_id: item_1.id)
    ii_2 = create(:invoice_item, invoice_id: inv_1.id, item_id: item_2.id)
    ii_3 = create(:invoice_item, invoice_id: inv_2.id, item_id: item_3.id)

    get "/api/v1/invoices/#{inv_1.id}/invoice_items"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:status)
    expect(data[:attributes]).to have_key(:customer_id)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:relationships][:invoice_items][:data].first[:id]).to eq(ii_1.id.to_s)
    expect(data[:relationships][:invoice_items][:data].last[:id]).to eq(ii_2.id.to_s)
    expect(data[:relationships][:invoice_items][:data].last[:id]).to_not eq(ii_3.id.to_s)
  end
end
