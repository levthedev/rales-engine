class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  def transactions
    invoices.flat_map { |invoice| invoice.transactions }
  end

 def favorite_merchant
    hash = Hash.new(0)
    merchants.map { |m| hash[m] += 1 }
    hash.max
  end
end
