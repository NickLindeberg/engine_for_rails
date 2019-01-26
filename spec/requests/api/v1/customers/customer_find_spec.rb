require 'rails_helper'

describe 'customer find request' do
  it 'finds customer by id' do
    cust_1 = create(:customer)
    cust_2 = create(:customer)

    get "/api/v1/customers/find?#{cust_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust_1.id.to_s)
  end

  it 'finds customer by first_name' do
    cust_1 = create(:customer, first_name: "Joe")
    cust_2 = create(:customer)

    get "/api/v1/customers/find?#{cust_1.first_name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust_1.id.to_s)
  end

  it 'finds customer by last_name' do
    cust_1 = create(:customer, last_name: "Bob")
    cust_2 = create(:customer)

    get "/api/v1/customers/find?#{cust_1.last_name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust_1.id.to_s)
  end

  it 'finds customer by created_at' do
    cust_1 = create(:customer, created_at: "2012-03-27 14:54:09 UTC")
    cust_2 = create(:customer)

    get "/api/v1/customers/find?#{cust_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust_1.id.to_s)
  end

  it 'finds customer by updated_at' do
    cust_1 = create(:customer, updated_at: "2012-03-27 14:54:09 UTC")
    cust_2 = create(:customer)

    get "/api/v1/customers/find?#{cust_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust_1.id.to_s)
  end
end
