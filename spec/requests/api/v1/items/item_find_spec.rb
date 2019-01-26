require 'rails_helper'

describe 'item request' do
  it 'can find an item by id' do
    merchant = create(:merchant)
    create_list(:item, 2, merchant_id: merchant.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/find?#{item_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:attributes]).to have_key(:description)
    expect(data[:attributes]).to have_key(:unit_price)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:id]).to eq(item_1.id.to_s)
    expect(data[:id]).to_not eq(item_2.id.to_s)
  end

  it 'can find an item by name' do
    merchant = create(:merchant)
    item_1 = create(:item, name: "Slanket", merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/find?#{item_1.name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:attributes]).to have_key(:description)
    expect(data[:attributes]).to have_key(:unit_price)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:id]).to eq(item_1.id.to_s)
    expect(data[:id]).to_not eq(item_2.id.to_s)
  end
  it 'can find an item by description' do
    merchant = create(:merchant)
    item_1 = create(:item, name: "Slanket", merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)
    item_1 = Item.first
    item_2 = Item.last

    get "/api/v1/items/find?#{item_1.name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:attributes]).to have_key(:description)
    expect(data[:attributes]).to have_key(:unit_price)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:id]).to eq(item_1.id.to_s)
    expect(data[:id]).to_not eq(item_2.id.to_s)
  end
end
