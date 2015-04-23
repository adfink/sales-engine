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

  def global_engine
    @repository.engine
  end
  #
  # def invoices
  #   repo = global_engine.invoice_repo
  #   repo.find_by_customer_id(@id)
  # end
end
