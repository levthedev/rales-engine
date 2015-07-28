class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.load_all(params)
    if params[:merchant_id]
      respond_with Invoice.where(merchant_id: params[:merchant_id])
    elsif params[:customer_id]
      respond_with Invoice.where(customer_id: params[:customer_id])
    else
      Invoice.all
    end
  end
end
