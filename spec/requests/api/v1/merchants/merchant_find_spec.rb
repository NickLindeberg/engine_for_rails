require 'rails_helper'

describe 'merchant find' do
  it 'can find a merchant by id' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)

    get "/api/v1/merchants/find?#{merchant_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:id]).to eq(merchant_1.id.to_s)
    expect(data[:id]).to_not eq(merchant_2.id.to_s)
  end

  it 'can find a merchant by name' do
    merchant_1 = create(:merchant, name: "Fred and Joes Pizza")
    merchant_2 = create(:merchant)

    get "/api/v1/merchants/find?#{merchant_1.name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:id]).to eq(merchant_1.id.to_s)
    expect(data[:id]).to_not eq(merchant_2.id.to_s)
  end

end
