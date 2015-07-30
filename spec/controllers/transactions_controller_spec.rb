require 'rails_helper'

describe Api::V1::TransactionsController do
  context '#index' do
    it 'returns all the transactions' do
      merchant = Merchant.create(name: 'Merch')
      customer = Customer.create(first_name: 'Lev', last_name: 'Kravinsky')
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")
      Transaction.create(invoice_id: invoice.id, result: "success", credit_card_number: "1234343")

      get :index, format: :json

      expect(response).to have_http_status(:ok)
      transactions = JSON.parse(response.body)
      expect(transactions.count).to eq(1)

      transaction = transactions.first
      expect(transaction['result']).to eq('success')
    end
  end

  context '#show' do
    it 'returns a merchant' do
      merchant = Merchant.create(name: 'Merch')
      customer = Customer.create(first_name: 'Lev', last_name: 'Kravinsky')
      invoice = Invoice.create(customer_id: customer.id, merchant_id: merchant.id, status: "shipped")

      transaction = Transaction.create(invoice_id: invoice.id, result: "success", credit_card_number: "1234")

      get :show, id: transaction.id, format: :json

      expect(response).to have_http_status(:ok)
      transaction = JSON.parse(response.body)

      expect(transaction['result']).to eq('success')
      expect(transaction['credit_card_number']).to eq('1234')
    end
  end
end
