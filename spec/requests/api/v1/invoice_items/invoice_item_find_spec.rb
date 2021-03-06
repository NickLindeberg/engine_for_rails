require 'rails_helper'

describe 'invoice_item find request' do
  it 'finds invoice_item by id' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, quantity: 4, invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find?id=#{ii_1.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(ii_1.id.to_s)
    expect(data[:id]).to_not eq(ii_2.id.to_s)
  end

  it 'finds invoice_item by quantity' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, quantity: 4, invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find?quantity=#{ii_1.quantity}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(ii_1.id.to_s)
    expect(data[:id]).to_not eq(ii_2.id.to_s)
  end

  it 'finds invoice_item by unit_price' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, unit_price: 15, invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find?unit_price=#{ii_1.unit_price}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(ii_1.id.to_s)
    expect(data[:id]).to_not eq(ii_2.id.to_s)
  end

  it 'finds invoice_item by created_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, created_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find?created_at=#{ii_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(ii_1.id.to_s)
    expect(data[:id]).to_not eq(ii_2.id.to_s)
  end

  it 'finds invoice_item by updated_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, updated_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find?updated_at=#{ii_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(ii_1.id.to_s)
    expect(data[:id]).to_not eq(ii_2.id.to_s)
  end
end
