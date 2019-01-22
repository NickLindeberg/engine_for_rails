require 'rails_helper'

describe 'merchant request' do
  it 'shows a list of all merchants' do
    create_list(:merchant, 3)

    get '/api/v1/merchants'

    expect(response).to be_successful
    parsed = JSON.parse(response.body)["data"]

    expect(parsed.count).to eq(3)
  end
end
