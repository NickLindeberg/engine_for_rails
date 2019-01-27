require 'rails_helper'

describe 'transaction find' do
  it 'can find a transaction by id' do
    customer = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    inv_2 = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    tran = create(:transaction, invoice_id: inv_1.id)

    get "/api/v1/transactions/#{tran.id}/invoice"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:credit_card_number)
    expect(data[:attributes]).to have_key(:credit_card_expiration_date)
    expect(data[:attributes]).to have_key(:result)
    expect(data[:attributes]).to have_key(:invoice_id)
    expect(data[:relationships][:invoice][:data][:id]).to eq(inv_1.id.to_s)
    expect(data[:relationships][:invoice][:data][:id]).to_not eq(inv_2.id.to_s)
  end
end
