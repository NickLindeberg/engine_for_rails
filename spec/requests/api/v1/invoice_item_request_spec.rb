require 'rails_helper'

describe 'invoice_item request' do
  it 'shows a list of all invoice_items' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    invoice_items = create_list(:invoice_item, 3, invoice_id: invoice.id, item_id: item.id)

    get '/api/v1/invoice_items.json'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:unit_price)
    expect(data.first[:attributes]).to have_key(:quantity)
  end
end
