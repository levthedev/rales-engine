require 'rails_helper'

describe Api::V1::CustomersController do
  context '#index' do
    it 'returns all the customers' do
      Customer.create(first_name: 'Lev', last_name: 'Kravinsky')

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      customers = JSON.parse(response.body)
      expect(customers.count).to eq(1)

      customer = customers.first
      expect(customer['first_name']).to eq('Lev')
      expect(customer['last_name']).to eq('Kravinsky')
    end
  end

  context '#show' do
    it 'returns a merchant' do
      customer = Customer.create(first_name: 'Lev', last_name: 'Kravinsky')

      get :show, id: customer.id, format: :json

      expect(response).to have_http_status(:ok)
      customer = JSON.parse(response.body)

      expect(customer['first_name']).to eq('Lev')
      expect(customer['last_name']).to eq('Kravinsky')
    end
  end
end
