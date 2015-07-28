class Item < ActiveRecord::Base
  belongs_to :merchant
  has_many :invoice_items
  has_many :invoices, through: :invoice_items

  def self.load_all(params)
    if params[:merchant_id]
      respond_with Item.where(merchant_id: params[:merchant_id])
    elsif params[:invoice_id]
      respond_with Invoice.find_by(id: params[:invoice_id]).items
    else
      respond_with Item.all
    end
  end

  def self.most_revenue(count)
    all.max_by(count.to_i) { |i| i.revenue }.reverse
   #    hash = Hash.new(0)
   # all.map do |item|
   #   hash[item] += item.revenue
   # end
   # hash.max(count.to_i)

  end

  def revenue
    Invoice.successful.joins(:invoice_items).where(invoice_items: {item_id: id}).sum("quantity * unit_price")
  end
end
