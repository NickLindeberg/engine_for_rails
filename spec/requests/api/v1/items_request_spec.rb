require 'rails_helper'

describe 'item request' do
  it 'shows a list of all items' do
    merchant = create(:merchant)
    create_list(:item, 3, merchant_id: merchant.id)

    get '/api/v1/items.json'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:attributes]).to have_key(:description)
    expect(data.first[:attributes]).to have_key(:unit_price)
    expect(data.first[:attributes]).to have_key(:merchant_id)
  end
  it 'shows a single item' do
    merchant = create(:merchant)
    create_list(:item, 2, merchant_id: merchant.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/#{item_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data[:id]).to eq(item_1.id.to_s)
    expect(data[:id]).to_not eq(item_2.id.to_s)
  end
end
