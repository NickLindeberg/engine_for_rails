require 'rails_helper'

describe 'merchant find' do
  it 'can find a merchant by name' do
    merchant_1 = create(:merchant, name: "Rad shoppe")
    merchant_2 = create(:merchant, name: "Rad shoppe")
    merchant_3 = create(:merchant)

    get "/api/v1/merchants/find_all?name=#{merchant_1.name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:id]).to eq(merchant_1.id.to_s)
    expect(data.last[:id]).to eq(merchant_2.id.to_s)
    expect(data.last[:id]).to_not eq(merchant_3.id.to_s)
  end
  it 'can find a merchant by created_at' do
    merchant_1 = create(:merchant, created_at: "2012-03-27 14:54:09 UTC")
    merchant_2 = create(:merchant, created_at: "2012-03-27 14:54:09 UTC")
    merchant_3 = create(:merchant)

    get "/api/v1/merchants/find_all?created_at=#{merchant_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:id]).to eq(merchant_1.id.to_s)
    expect(data.last[:id]).to eq(merchant_2.id.to_s)
    expect(data.last[:id]).to_not eq(merchant_3.id.to_s)
  end
  it 'can find a merchant by updated_at' do
    merchant_1 = create(:merchant, updated_at: "2012-03-27 14:54:09 UTC")
    merchant_2 = create(:merchant, updated_at: "2012-03-27 14:54:09 UTC")
    merchant_3 = create(:merchant)

    get "/api/v1/merchants/find_all?updated_at=#{merchant_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
    expect(data.first[:id]).to eq(merchant_1.id.to_s)
    expect(data.last[:id]).to eq(merchant_2.id.to_s)
    expect(data.last[:id]).to_not eq(merchant_3.id.to_s)
  end
end
