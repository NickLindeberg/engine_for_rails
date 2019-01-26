require 'rails_helper'

describe 'customer find request' do
  it 'finds customer by id' do
    cust_1 = create(:customer)
    cust_2 = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, customer_id: cust_1.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, customer_id: cust_1.id, merchant_id: merchant.id)
    inv_3 = create(:invoice, customer_id: cust_2.id, merchant_id: merchant.id)

    get "/api/v1/customers/#{cust_1.id}/invoices"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust_1.id.to_s)
    expect(parsed[:data][:relationships][:invoices][:data].first[:id]).to eq(inv_1.id.to_s)
    expect(parsed[:data][:relationships][:invoices][:data].last[:id]).to eq(inv_2.id.to_s)
    expect(parsed[:data][:relationships][:invoices][:data].last[:id]).to_not eq(inv_3.id.to_s)
  end
end
