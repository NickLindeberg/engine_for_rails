require 'rails_helper'

describe 'customer find request' do
  it 'finds customer by id' do
    create_list(:customer, 2)
    cust = Customer.first

    get "/api/v1/customers/find?#{cust.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust.id.to_s)
  end

  it 'finds customer by first_name' do
    create_list(:customer, 2)
    cust = Customer.first

    get "/api/v1/customers/find?#{cust.first_name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust.id.to_s)
  end

  it 'finds customer by last_name' do
    create_list(:customer, 2)
    cust = Customer.first

    get "/api/v1/customers/find?#{cust.last_name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust.id.to_s)
  end

  it 'finds customer by created_at' do
    create_list(:customer, 2)
    cust = Customer.first

    get "/api/v1/customers/find?#{cust.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust.id.to_s)
  end

  it 'finds customer by updated_at' do
    create_list(:customer, 2)
    cust = Customer.first

    get "/api/v1/customers/find?#{cust.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(cust.id.to_s)
  end
end
