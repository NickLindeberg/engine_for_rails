require 'rails_helper'

describe 'invoice_item find request' do
  it 'finds invoice_item by id' do
    customer = create(:customer)
    merchant = create(:merchant)
    invoice = create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    item = create(:item, merchant_id: merchant.id)
    invoice_items = create_list(:invoice_item, 2, invoice_id: invoice.id, item_id: item.id)
    ii = InvoiceItem.first

    get "/api/v1/invoice_items/find?#{ii.id}"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:id]).to eq(ii.id.to_s)
  end

end
