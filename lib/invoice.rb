require './lib/invoices_repository'

class Invoice
attr_accessor :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

  def initialize(row, repository)
    @repository  = repository
    @id          = row[:id]
    @customer_id = row[:customer_id]
    @merchant_id = row[:merchant_id]
    @status      = row[:status]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
  end

  def transactions
    @repository.find_all_transactions_by_invoice_id(id)
  end

  def invoice_items
    @repository.find_all_invoice_items_by_invoice_id(id)
  end

  def items
    @repository.find_all_items_by_invoice_id(id)
  end

  def customer
    @repository.find_customer_by_customer_id(customer_id)
  end

  def merchant
    @repository.find_merchant_by_merchant_id(merchant_id)
  end
end
