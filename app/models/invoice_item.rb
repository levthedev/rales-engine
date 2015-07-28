class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def self.load_all(params)
    if params[:invoice_id]
      InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:item_id]
      InvoiceItem.where(item_id: params[:item_id])
    else
      InvoiceItem.all
    end
  end
end
