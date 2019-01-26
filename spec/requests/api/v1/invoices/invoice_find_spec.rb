require 'rails_helper'

describe 'invoice_item find request' do
  it 'finds invoice by id' do
    customer = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices/find?#{inv_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:status)
    expect(data[:attributes]).to have_key(:customer_id)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:id]).to eq(inv_1.id.to_s)
    expect(data[:id]).to_not eq(inv_2.id.to_s)
  end

  it 'finds invoice by status' do
    customer = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, status: "pending", customer_id: customer.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, status: "on fire", customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices/find?#{inv_1.status}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:status)
    expect(data[:attributes]).to have_key(:customer_id)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:id]).to eq(inv_1.id.to_s)
    expect(data[:id]).to_not eq(inv_2.id.to_s)
  end

  it 'finds invoice by created_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, created_at: "2012-03-27 14:54:09 UTC", customer_id: customer.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, status: "on fire", customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices/find?#{inv_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:status)
    expect(data[:attributes]).to have_key(:customer_id)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:id]).to eq(inv_1.id.to_s)
    expect(data[:id]).to_not eq(inv_2.id.to_s)
  end

  it 'finds invoice by updated_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    inv_1 = create(:invoice, updated_at: "2012-03-27 14:54:09 UTC", customer_id: customer.id, merchant_id: merchant.id)
    inv_2 = create(:invoice, status: "on fire", customer_id: customer.id, merchant_id: merchant.id)

    get "/api/v1/invoices/find?#{inv_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:status)
    expect(data[:attributes]).to have_key(:customer_id)
    expect(data[:attributes]).to have_key(:merchant_id)
    expect(data[:id]).to eq(inv_1.id.to_s)
    expect(data[:id]).to_not eq(inv_2.id.to_s)
  end
end
