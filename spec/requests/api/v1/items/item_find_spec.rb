require 'rails_helper'

describe 'item find all request' do
  it 'can find an item by id' do
    merchant = create(:merchant)
    item_1 = create(:item, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find?id=#{item_1.id}"

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

    get "/api/v1/items/find?name=#{item_1.name}"

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
    item_1 = create(:item, description: "will get you all the stuff", merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find?description=#{item_1.description}"

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

  it 'can find an item by unit_price' do
    merchant = create(:merchant)
    item_1 = create(:item, unit_price: 30, merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find?unit_price=#{item_1.unit_price}"

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

  it 'can find an item by created_at' do
    merchant = create(:merchant)
    item_1 = create(:item, created_at: "2012-03-27 14:54:09 UTC", merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find?created_at=#{item_1.created_at}"

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

  it 'can find an item by updated_at' do
    merchant = create(:merchant)
    item_1 = create(:item, updated_at: "2012-03-27 14:54:09 UTC", merchant_id: merchant.id)
    item_2 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find?updated_at=#{item_1.updated_at}"

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
