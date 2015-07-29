class Merchant < ActiveRecord::Base
  has_many :items
  has_many :invoices
  has_many :customers, through: :invoices

  def total_revenue
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price").to_f
  end

  def total_items
    invoices.successful.joins(:invoice_items).sum("quantity").to_f
  end

  def self.most_revenue(quantity)
    all.sort_by { |merchant| merchant.total_revenue }.last(quantity.to_i).reverse
  end

  def self.most_items(quantity)
    all.sort_by { |merchant| merchant.total_items }.last(quantity.to_i).reverse
  end

  def self.revenue(date)
    { total_revenue: all.map { |merchant| merchant.revenue(date) }.reduce(0) {|merch_rev| merch_rev} }
  end

  def revenue(date)
    { revenue: invoices.successful.where(created_at: date).joins(:invoice_items).sum("quantity * unit_price").to_f }.to_json
  end

  def favorite_customer
    hash = Hash.new(0)
    customers.map { |c| hash[c] += 1 }
    max_value = hash.values.max
    hash.map { |k,v| k if v == max_value }.compact
  end

  def customers_with_pending_invoices
    (invoices - invoices.successful).map(&:customer).uniq
  end
end
