require 'rails_helper'

describe 'customer request' do
  it 'shows a list of all customers' do
    create_list(:customer, 3)

    get '/api/v1/customers.json'

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.count).to eq(3)
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:first_name)
    expect(data.first[:attributes]).to have_key(:last_name)
  end
end
