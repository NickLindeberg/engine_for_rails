require 'rails_helper'

describe 'invoice_item customer request' do
  it 'finds invoices customer' do
    customer = create(:customer)
    customer_2 = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices/#{inv_1.id}/customer"

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
    expect(data[:relationships][:customer][:data][:id]).to eq(customer.id.to_s)
    expect(data[:relationships][:customer][:data][:id]).to_not eq(customer_2.id.to_s)
  end
end
