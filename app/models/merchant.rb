class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def total_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price").to_i
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum("quantity").to_i
  end

  def self.most_revenue(quantity)
    all.sort_by { |merchant| merchant.total_revenue }.last(quantity.to_i).reverse
  end

  def self.most_items(quantity)
    all.sort_by { |merchant| merchant.total_items }.last(quantity.to_i).reverse
  end

  def self.revenue(date)
    all.map { |merchant| merchant.revenue(date) }.reduce(:+)
  end

  def revenue(date)
    invoices.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price").to_i
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map do |c|
      hash[c] += 1
    end
    hash.max
  end

  def customers_with_pending_invoices
    (invoices - invoices.successful).map(&:customer).uniq
  end
end
