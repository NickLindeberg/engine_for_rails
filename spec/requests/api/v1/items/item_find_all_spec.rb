require 'rails_helper'

describe 'item request' do
  it 'can find an item by name' do
    merchant = create(:merchant)
    item_1 = create(:item, name: "Slanket", merchant_id: merchant.id)
    item_2 = create(:item, name: "Slanket", merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find_all?name=#{item_1.name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:attributes]).to have_key(:description)
    expect(data.first[:attributes]).to have_key(:unit_price)
    expect(data.first[:attributes]).to have_key(:merchant_id)
    expect(data.first[:id]).to eq(item_1.id.to_s)
    expect(data.last[:id]).to eq(item_2.id.to_s)
    expect(data.last[:id]).to_not eq(item_3.id.to_s)
  end

  it 'can find an item by description' do
    merchant = create(:merchant)
    item_1 = create(:item, description: "keeps you warm", merchant_id: merchant.id)
    item_2 = create(:item, description: "keeps you warm", merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find_all?description=#{item_1.description}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:attributes]).to have_key(:description)
    expect(data.first[:attributes]).to have_key(:unit_price)
    expect(data.first[:attributes]).to have_key(:merchant_id)
    expect(data.first[:id]).to eq(item_1.id.to_s)
    expect(data.last[:id]).to eq(item_2.id.to_s)
    expect(data.last[:id]).to_not eq(item_3.id.to_s)
  end

  it 'can find an item by unit_price' do
    merchant = create(:merchant)
    item_1 = create(:item, unit_price: 40, merchant_id: merchant.id)
    item_2 = create(:item, unit_price: 40, merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find_all?unit_price=#{item_1.unit_price}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:attributes]).to have_key(:description)
    expect(data.first[:attributes]).to have_key(:unit_price)
    expect(data.first[:attributes]).to have_key(:merchant_id)
    expect(data.first[:id]).to eq(item_1.id.to_s)
    expect(data.last[:id]).to eq(item_2.id.to_s)
    expect(data.last[:id]).to_not eq(item_3.id.to_s)
  end

  it 'can find an item by created_at' do
    merchant = create(:merchant)
    item_1 = create(:item, created_at: "2012-03-27 14:54:09 UTC", merchant_id: merchant.id)
    item_2 = create(:item, created_at: "2012-03-27 14:54:09 UTC", merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find_all?created_at=#{item_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:attributes]).to have_key(:description)
    expect(data.first[:attributes]).to have_key(:unit_price)
    expect(data.first[:attributes]).to have_key(:merchant_id)
    expect(data.first[:id]).to eq(item_1.id.to_s)
    expect(data.last[:id]).to eq(item_2.id.to_s)
    expect(data.last[:id]).to_not eq(item_3.id.to_s)
  end
  it 'can find an item by updated_at' do
    merchant = create(:merchant)
    item_1 = create(:item, updated_at: "2012-03-27 14:54:09 UTC", merchant_id: merchant.id)
    item_2 = create(:item, updated_at: "2012-03-27 14:54:09 UTC", merchant_id: merchant.id)
    item_3 = create(:item, merchant_id: merchant.id)

    get "/api/v1/items/find_all?updated_at=#{item_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:attributes]).to have_key(:description)
    expect(data.first[:attributes]).to have_key(:unit_price)
    expect(data.first[:attributes]).to have_key(:merchant_id)
    expect(data.first[:id]).to eq(item_1.id.to_s)
    expect(data.last[:id]).to eq(item_2.id.to_s)
    expect(data.last[:id]).to_not eq(item_3.id.to_s)
  end
end
