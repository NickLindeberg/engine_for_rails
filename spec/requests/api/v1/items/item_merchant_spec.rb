require 'rails_helper'

describe 'item invoice_item find' do
  it 'can find an invoice items for an item' do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/#{item_1.id}/merchant"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:attributes]).to have_key(:description)
    expect(data[:attributes]).to have_key(:unit_price)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:relationships][:merchant][:data][:id]).to eq(merchant.id.to_s)
  end
end
