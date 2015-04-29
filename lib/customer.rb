require_relative 'customer_repository'

class Customer
attr_accessor :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(row, repository)
    @repository = repository
    @id         = row[:id].to_i
    @first_name = row[:first_name]
    @last_name  = row[:last_name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
  end

  def inspect
    "customer number #{id}"
  end

  def invoices
    @repository.find_all_invoices_by_customer_id(id)
  end

  def transactions
    invoices.map{|invoice| invoice.transactions}.flatten
  end

  def successful_invoices
    @repository.find_successful_invoices(invoices)
  end

  def favorite_merchant
    @repository.favorite_merchant(successful_invoices)
  end
end
