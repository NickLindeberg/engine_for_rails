require 'rails_helper'

describe 'merchant request' do
  it 'shows a list of all merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants.json'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:name)
  end

  it 'shows a list of all merchants' do
    create_list(:merchant, 2)
    merc_1 = Merchant.first
    merc_2 = Merchant.last

    get "/api/v1/merchants/#{merc_1.id}.json"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(merc_1.id.to_s)
    expect(data[:id]).to_not eq(merc_2.id.to_s)
  end
end
