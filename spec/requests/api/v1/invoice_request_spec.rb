require 'rails_helper'

describe 'invoice request' do
  it 'shows a list of all invoices' do
    customer = create(:customer)
    merchant = create(:merchant)
    create_list(:invoice, 3, customer_id: customer.id, merchant_id: merchant.id)

    get '/api/v1/invoices.json'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:status)
    expect(data.first[:attributes]).to have_key(:customer_id)
    expect(data.first[:attributes]).to have_key(:merchant_id)
  end

  it 'shows a list of an invoice' do
    customer = create(:customer)
    merchant = create(:merchant)
    create_list(:invoice, 2, customer_id: customer.id, merchant_id: merchant.id)
    inv_1 = Invoice.first
    inv_2 = Invoice.last

    get "/api/v1/invoices/#{inv_1.id}.json"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]

    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(inv_1.id.to_s)
    expect(data[:id]).to_not eq(inv_2.id.to_s)
  end
end
