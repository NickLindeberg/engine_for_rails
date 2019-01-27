require 'rails_helper'

describe 'invoice_item item request' do
  it 'finds invoice_items item' do
    customer = create(:customer)
    merc_1 = create(:merchant)
    invoice = create(:invoice, merchant_id: merc_1.id, customer_id: customer.id)
    invoice_2 = create(:invoice, merchant_id: merc_1.id, customer_id: customer.id)
    item = create(:item, merchant_id: merc_1.id)
    ii_1 = create(:invoice_item, invoice_id: invoice.id, item_id: item.id)

    get "/api/v1/invoice_items/#{ii_1.id}/invoice"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:relationships][:invoice][:data][:id]).to eq(invoice.id.to_s)
    expect(data[:relationships][:invoice][:data][:id]).to_not eq(invoice_2.id.to_s)
  end
end
