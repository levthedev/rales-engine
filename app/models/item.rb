class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.load_all(params)
    if params[:merchant_id]
      Item.where(merchant_id: params[:merchant_id])
    elsif params[:invoice_id]
      Invoice.find_by(id: params[:invoice_id]).items
    else
      Item.all
    end
  end

  def self.most_revenue(count)
    Item.joins(:invoices).merge(Invoice.successful).group(:name).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"').sort_by(&:last).reverse.take(count.to_i).map {|n, _| Item.find_by(name: n)}
  end

  def self.most_items(quantity)
    Item.joins(:invoices).merge(Invoice.successful).group(:name).sum(:quantity).sort_by(&:last).last(quantity.to_i).map { |n, _| Item.find_by(name: n)}
  end

  def revenue(date)
   invoices.successful.joins(:invoice_items).sum('"invoice_items"."quantity" * "invoice_items"."unit_price"')
  end

  def best_day

  end
end
