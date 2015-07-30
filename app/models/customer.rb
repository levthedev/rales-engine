class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  def transactions
    invoices.flat_map { |invoice| invoice.transactions }
  end

  def favorite_merchant
    merchant_id = calculate_favorite_merchant
    Merchant.find_by(id: merchant_id)
  end

  def calculate_favorite_merchant
    invoices.successful.group(:merchant_id).count(:merchant_id).sort_by(&:last).last[0]
  end
end
