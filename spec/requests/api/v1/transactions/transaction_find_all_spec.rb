require 'rails_helper'

describe 'transaction find' do
  it 'can find a transaction by credit_card_number' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    tran_1 = create(:transaction, credit_card_number: "1234", invoice_id: invoice.id)
    tran_2 = create(:transaction, credit_card_number: "1234", invoice_id: invoice.id)
    tran_3 = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/find_all?credit_card_number=#{tran_1.credit_card_number}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:credit_card_number)
    expect(data.first[:attributes]).to have_key(:credit_card_expiration_date)
    expect(data.first[:attributes]).to have_key(:result)
    expect(data.first[:attributes]).to have_key(:invoice_id)
    expect(data.first[:id]).to eq(tran_1.id.to_s)
    expect(data.last[:id]).to eq(tran_2.id.to_s)
    expect(data.last[:id]).to_not eq(tran_3.id.to_s)
  end

  it 'can find a transaction by result' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    tran_1 = create(:transaction, result: "success", invoice_id: invoice.id)
    tran_2 = create(:transaction, result: "success", invoice_id: invoice.id)
    tran_3 = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/find_all?result=#{tran_1.result}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:credit_card_number)
    expect(data.first[:attributes]).to have_key(:credit_card_expiration_date)
    expect(data.first[:attributes]).to have_key(:result)
    expect(data.first[:attributes]).to have_key(:invoice_id)
    expect(data.first[:id]).to eq(tran_1.id.to_s)
    expect(data.last[:id]).to eq(tran_2.id.to_s)
    expect(data.last[:id]).to_not eq(tran_3.id.to_s)
  end

  it 'can find a transaction by created_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    tran_1 = create(:transaction, created_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id)
    tran_2 = create(:transaction, created_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id)
    tran_3 = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/find_all?created_at=#{tran_1.created_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:credit_card_number)
    expect(data.first[:attributes]).to have_key(:credit_card_expiration_date)
    expect(data.first[:attributes]).to have_key(:result)
    expect(data.first[:attributes]).to have_key(:invoice_id)
    expect(data.first[:id]).to eq(tran_1.id.to_s)
    expect(data.last[:id]).to eq(tran_2.id.to_s)
    expect(data.last[:id]).to_not eq(tran_3.id.to_s)
  end
  it 'can find a transaction by updated_at' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    tran_1 = create(:transaction, updated_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id)
    tran_2 = create(:transaction, updated_at: "2012-03-27 14:54:09 UTC", invoice_id: invoice.id)
    tran_3 = create(:transaction, invoice_id: invoice.id)

    get "/api/v1/transactions/find_all?updated_at=#{tran_1.updated_at}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data.first).to have_key(:id)
    expect(data.first).to have_key(:type)
    expect(data.first).to have_key(:attributes)
    expect(data.first[:attributes]).to have_key(:credit_card_number)
    expect(data.first[:attributes]).to have_key(:credit_card_expiration_date)
    expect(data.first[:attributes]).to have_key(:result)
    expect(data.first[:attributes]).to have_key(:invoice_id)
    expect(data.first[:id]).to eq(tran_1.id.to_s)
    expect(data.last[:id]).to eq(tran_2.id.to_s)
    expect(data.last[:id]).to_not eq(tran_3.id.to_s)
  end
end
