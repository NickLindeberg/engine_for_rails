require 'rails_helper'

describe 'customer find_all request' do
  it 'finds all customers with first_name' do
    cust_1 = create(:customer, first_name: "rad")
    cust_2 = create(:customer, first_name: "rad")
    cust_3 = create(:customer)

    get "/api/v1/customers/find_all?first_name=#{cust_1.first_name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(cust_1.id.to_s)
    expect(data.last[:id]).to eq(cust_2.id.to_s)
    expect(data.last).to_not eq(cust_3.id.to_s)
  end

  it 'finds all customers with last_name' do
    cust_1 = create(:customer, last_name: "mobile")
    cust_2 = create(:customer, last_name: "mobile")
    cust_3 = create(:customer)

    get "/api/v1/customers/find_all?last_name=#{cust_1.last_name}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(cust_1.id.to_s)
    expect(data.last[:id]).to eq(cust_2.id.to_s)
    expect(data.last).to_not eq(cust_3.id.to_s)
  end

  it 'finds all customers with created_at' do
    cust_1 = create(:customer, created_at: "2012-03-27 14:54:09 UTC")
    cust_2 = create(:customer, created_at: "2012-03-27 14:54:09 UTC")
    cust_3 = create(:customer)

    get "/api/v1/customers/find_all?created_at=#{cust_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(cust_1.id.to_s)
    expect(data.last[:id]).to eq(cust_2.id.to_s)
    expect(data.last).to_not eq(cust_3.id.to_s)
  end

  it 'finds all customers with updated_at' do
    cust_1 = create(:customer, updated_at: "2012-03-27 14:54:09 UTC")
    cust_2 = create(:customer, updated_at: "2012-03-27 14:54:09 UTC")
    cust_3 = create(:customer)

    get "/api/v1/customers/find_all?updated_at=#{cust_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(cust_1.id.to_s)
    expect(data.last[:id]).to eq(cust_2.id.to_s)
    expect(data.last).to_not eq(cust_3.id.to_s)
  end
end
