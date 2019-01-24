require 'rails_helper'

describe 'transaction request' do
  it 'shows a list of all transactions' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:transaction, 3, invoice_id: invoice.id)

    get '/api/v1/transactions.json'

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
  it 'shows a single transaction' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    create_list(:transaction, 2, invoice_id: invoice.id)
    tran_1 = Transaction.first
    tran_2 = Transaction.last

    get "/api/v1/transactions/#{tran_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(tran_1.id.to_s)
    expect(data[:id]).to_not eq(tran_2.id.to_s)
  end
end
