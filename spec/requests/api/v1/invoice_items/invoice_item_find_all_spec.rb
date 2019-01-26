require 'rails_helper'

describe 'invoice_item find_all request' do
  it 'finds all invoice_items by quantity' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, quantity: 4, invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, quantity: 4, invoice_id: invoice.id, item_id: item.id)
    ii_3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find_all?quantity=#{ii_1.quantity}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(ii_1.id.to_s)
    expect(data.last[:id]).to eq(ii_2.id.to_s)
    expect(data.last[:id]).to_not eq(ii_3.id.to_s)
  end
  
  it 'finds all invoice_items by unit_price' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, unit_price: 4, invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, unit_price: 4, invoice_id: invoice.id, item_id: item.id)
    ii_3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find_all?unit_price=#{ii_1.unit_price}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(ii_1.id.to_s)
    expect(data.last[:id]).to eq(ii_2.id.to_s)
    expect(data.last[:id]).to_not eq(ii_3.id.to_s)
  end

  it 'finds all invoice_items by created_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, created_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, created_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id, item_id: item.id)
    ii_3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find_all?created_at=#{ii_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(ii_1.id.to_s)
    expect(data.last[:id]).to eq(ii_2.id.to_s)
    expect(data.last[:id]).to_not eq(ii_3.id.to_s)
  end

  it 'finds all invoice_items by updated_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    ii_1 = create(:invoice_item, updated_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id, item_id: item.id)
    ii_2 = create(:invoice_item, updated_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id, item_id: item.id)
    ii_3 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/find_all?updated_at=#{ii_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:id]).to eq(ii_1.id.to_s)
    expect(data.last[:id]).to eq(ii_2.id.to_s)
    expect(data.last[:id]).to_not eq(ii_3.id.to_s)
  end
end
