require 'rails_helper'

describe 'invoice request' do
  it 'shows a list of all invoice_items' do
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
end
