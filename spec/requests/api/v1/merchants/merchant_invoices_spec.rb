describe 'merchant invoices' do
  it 'can find invoices for a merchant' do
    merc_1 = create(:merchant)
    merc_2 = create(:merchant)
    customer = create(:customer)
    inv_1 = create(:invoice, merchant_id: merc_1.id, customer_id: customer.id)
    inv_2 = create(:invoice, merchant_id: merc_1.id, customer_id: customer.id)
    inv_3 = create(:invoice, merchant_id: merc_2.id, customer_id: customer.id)

    get "/api/v1/merchants/#{merc_1.id}/invoices"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:relationships][:invoices][:data].first[:id]).to eq(inv_1.id.to_s)
    expect(data[:relationships][:invoices][:data].last[:id]).to eq(inv_2.id.to_s)
    expect(data[:relationships][:invoices][:data].last[:id]).to_not eq(inv_3.id.to_s)
  end
end
