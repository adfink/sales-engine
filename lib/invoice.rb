require_relative 'invoice_repository'

class Invoice
attr_accessor :id,
              :customer_id,
              :merchant_id,
              :status,
              :created_at,
              :updated_at

attr_reader   :repository

  def initialize(row, repository)
    @repository  = repository
    @id          = row[:id].to_i
    @customer_id = row[:customer_id].to_i
    @merchant_id = row[:merchant_id].to_i
    @status      = row[:status]
    @created_at  = row[:created_at]
    @updated_at  = row[:updated_at]
  end

  def inspect
    "invoice number #{id}"
  end

  def transactions
    repository.find_all_transactions_by_invoice_id(id)
  end

  def items
    repository.find_all_items_by_invoice_id(id)
  end

  def invoice_items
    repository.find_all_invoice_items_by_invoice_id(id)
  end

  def customer
    repository.find_customer_by_customer_id(customer_id)
  end

  def merchant
    repository.find_merchant_by_merchant_id(merchant_id)
  end

  def successful?
    repository.am_i_successful?(id)
  end

  def charge(inputs)
    repository.charge(inputs, id)
  end
end
