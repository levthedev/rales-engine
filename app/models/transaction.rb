class Transaction < ActiveRecord::Base
  belongs_to :invoice

  def self.load_all(params = nil)
    if params[:invoice_id]
      Transaction.where(invoice_id: params[:invoice_id])
    else
      Transaction.all
    end
  end
end
