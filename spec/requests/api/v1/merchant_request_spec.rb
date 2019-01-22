require 'rails_helper'

describe 'merchant request' do
  it 'shows a list of all merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(parsed.count).to eq(3)
    expect(parsed.first).to have_key(:id)
    expect(parsed.first).to have_key(:type)
    expect(parsed.first).to have_key(:attributes)
    expect(parsed.first[:attributes]).to have_key(:name)
  end
end
