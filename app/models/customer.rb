class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  def transactions
    invoices.flat_map { |invoice| invoice.transactions }
  end
end
