require 'rails_helper'

describe 'customer find transactions' do
  it 'finds customer transactions' do
    cust_1 = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, customer_id: cust_1.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, customer_id: cust_1.id, merchant_id: merchant.id)
    tran_1 = create(:transaction, invoice_id: inv_1.id)
    tran_2 = create(:transaction, invoice_id: inv_2.id)

    cust_2 = create(:customer)
    inv_3 = create(:invoice, customer_id: cust_2.id, merchant_id: merchant.id)
    tran_3 = create(:transaction, invoice_id: inv_3.id)

    get "/api/v1/customers/#{cust_1.id}/transactions"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust_1.id.to_s)
    expect(parsed[:data][:relationships][:transactions][:data].first[:id]).to eq(tran_1.id.to_s)
    expect(parsed[:data][:relationships][:transactions][:data].last[:id]).to eq(tran_2.id.to_s)
    expect(parsed[:data][:relationships][:transactions][:data].last[:id]).to_not eq(tran_3.id.to_s)
  end
end
