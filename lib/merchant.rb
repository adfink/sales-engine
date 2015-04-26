require_relative 'merchants_repository'
require 'pry'
class Merchant
attr_accessor :id, :name, :created_at, :updated_at

  def initialize(row, repository)
    @repository = repository
    @id         = row[:id]
    @name       = row[:name]
    @created_at = row[:created_at]
    @updated_at = row[:updated_at]
  end

  def inspect
    "merchant number #{id}"
  end

  def items
    @repository.find_all_items_by_merchant_id(id)
  end

  def invoices
    @repository.find_all_invoices_by_merchant_id(id)
  end

  def merchant_revenue_by_id
    @repository.find_revenue_by_id(id)
  end

  def revenue(date = nil)
    date ? merchant_revenue(date) : merchant_revenue_by_id
  end

  def merchant_revenue(date)
    @repository.find_revenue_by_id_by_date(id, date)
  end

  def favorite_customer
   @repository.find_customer_for_each_successful_invoice(successful_invoices)
  end

  def successful_invoices
    @repository.find_successful_invoices(invoices)
  end

  def customers_with_pending_invoices
    failed_invoices = invoices.select{|invoice| invoice.successful? == false}
    pending_customer_ids = failed_invoices.map{|invoice| invoice.customer_id}
    pending_customer_ids.map {|customer_id| @repository.find_customer_by_customer_id(customer_id)}
  end
end



