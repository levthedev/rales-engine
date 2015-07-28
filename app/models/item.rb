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
end
