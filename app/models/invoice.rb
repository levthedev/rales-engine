class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions

  def self.load_all(params)
    if params[:merchant_id]
      Invoice.where(merchant_id: params[:merchant_id])
    elsif params[:customer_id]
      Invoice.where(customer_id: params[:customer_id])
    else
      all
    end
  end

  def self.successful
    joins(:transactions).where(transactions: { result: 'success' })
  end
end
