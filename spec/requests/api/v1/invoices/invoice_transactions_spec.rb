require 'rails_helper'

describe 'invoice_item merchant request' do
  it 'finds invoices merchant' do
    customer = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    tran_1 = create(:transaction, invoice_id: inv_1.id)
    tran_2 = create(:transaction, invoice_id: inv_1.id)
    tran_3 = create(:transaction, invoice_id: inv_2.id)

    get "/api/v1/invoices/#{inv_1.id}/transactions"

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
    expect(data[:relationships][:transactions][:data].first[:id]).to eq(tran_1.id.to_s)
    expect(data[:relationships][:transactions][:data].last[:id]).to eq(tran_2.id.to_s)
    expect(data[:relationships][:transactions][:data].last[:id]).to_not eq(tran_3.id.to_s)
  end
end
