describe 'merchant items' do
  it 'can find items for a merchant' do
    merc_1 = create(:merchant)
    merc_2 = create(:merchant)
    item_1 = create(:item, merchant_id: merc_1.id)
    item_2 = create(:item, merchant_id: merc_1.id)
    item_3 = create(:item, merchant_id: merc_2.id)

    get "/api/v1/merchants/#{merc_1.id}/items"

    expect(response).to be_successful
    parsed = JSON.parse(response.body, symbolize_names: true)
    expect(parsed).to have_key(:data)

    data = parsed[:data]
    expect(data).to have_key(:id)
    expect(data).to have_key(:type)
    expect(data).to have_key(:attributes)
    expect(data[:attributes]).to have_key(:name)
    expect(data[:relationships][:items][:data].first[:id]).to eq(item_1.id.to_s)
    expect(data[:relationships][:items][:data].last[:id]).to eq(item_2.id.to_s)
    expect(data[:relationships][:items][:data].last[:id]).to_not eq(item_3.id.to_s)
  end
end
