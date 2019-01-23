require 'rails_helper'

describe 'transaction request' do
  it 'shows a list of all transactions' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:transaction, 3, invoice_id: invoice.id )

    get '/api/v1/transactions'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:credit_card_number)
    expect(data.first[:attributes]).to have_key(:credit_card_expiration_date)
    expect(data.first[:attributes]).to have_key(:result)
    expect(data.first[:attributes]).to have_key(:invoice_id)
  end
end
