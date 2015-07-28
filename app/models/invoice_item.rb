class InvoiceItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :invoice

  def self.load_all(params)
    if params[:invoice_id]
      respond_with InvoiceItem.where(invoice_id: params[:invoice_id])
    elsif params[:item_id]
      respond_with InvoiceItem.where(item_id: params[:item_id])
    else
      respond_with InvoiceItem.all
    end
  end
end
