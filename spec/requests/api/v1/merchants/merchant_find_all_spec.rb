require 'rails_helper'

describe 'merchant find' do
  it 'can find a merchant by name' do
    merchant_1 = create(:merchant)
    merchant_2 = create(:merchant)
    merchant_2 = create(:merchant)

    get "/api/v1/merchants/find_all?name=#{merchant_1.id}"

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
