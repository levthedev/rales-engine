require 'rails_helper'

describe Api::V1::ItemsController do
  context '#index' do
    it 'returns all the items' do
      merchant = Merchant.create(name: 'Merch')
      Item.create(name: 'Sweet Item', description: 'asdf', unit_price: 12.5, merchant_id: merchant.id)

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      items = JSON.parse(response.body)
      expect(items.count).to eq(1)

      item = items.first
      expect(item['name']).to eq('Sweet Item')
      expect(item['description']).to eq('asdf')
    end
  end

  context '#show' do
    it 'returns a item' do
      merchant = Merchant.create(name: 'Merch')
      item = Item.create(name: 'Sweet Item', description: 'asdf', unit_price: 12.5, merchant_id: merchant.id)

      get :show, id: item.id, format: :json

      expect(response).to have_http_status(:ok)
      item = JSON.parse(response.body)

      expect(item['name']).to eq('Sweet Item')
      expect(item['description']).to eq('asdf')
    end
  end
end
