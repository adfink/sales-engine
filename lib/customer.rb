require './lib/customers_repository'

class Customer
attr_accessor :id,
              :first_name,
              :last_name,
              :created_at,
              :updated_at

  def initialize(row, repository)
    @repository = repository
    @id         = row[:id]
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
end
