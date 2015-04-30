require 'csv'
require_relative 'customer'
require_relative 'sales_engine'

class CustomerRepository
attr_reader :customers, :engine

  def initialize(engine, filepath)
    @engine = engine
    @customers = generate_customers(filepath)
  end

  def inspect
    "customer repository containing #{@customers.count} items"
  end

  def generate_customers(filepath)
    file_contents = CSV.open filepath, headers: true, header_converters: :symbol
    file_contents.map{|row| Customer.new(row, self)}
  end

  def check_for_file
    File.exist? "./data/customers.csv"
  end

  def output_file_contents
    File.read "./data/customers.csv"
  end

  def all
    @customers
  end

  def random
    @customers.sample
  end

  def find_by_id(number)
    @customers.find {|customer| customer.id == number}
  end

  def find_by_first_name(first_name)
    @customers.find {|customer| customer.first_name == first_name}
  end

  def find_all_by_first_name(first_name)
    @customers.find_all {|customer| customer.first_name == first_name}
  end

  def find_by_last_name(last_name)
    @customers.find {|customer| customer.last_name == last_name}
  end

  def find_all_by_last_name(last_name)
    @customers.find_all {|customer| customer.last_name == last_name}
  end

  def find_by_created_at(time)
    @customers.find {|customer| customer.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    @customers.find_all {|customer| customer.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    @customers.find {|customer| customer.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    @customers.find_all {|customer| customer.updated_at.to_s == time}
  end

  def find_all_invoices_by_customer_id(customer_id)
    @engine.find_all_invoices_by_customer_id(customer_id)
  end

  def find_successful_invoices(invoices)
    @engine.find_successful_invoices(invoices)
  end

  def find_favorite_merchant(successful_invoices)
    invoices_by_merchant = successful_invoices.group_by do |invoice|
      invoice.merchant_id
    end
    favorite_merchant_id = invoices_by_merchant.map do |k, v|
      [v.size, k]
    end.sort[-1][-1]
    @engine.find_merchant_by_merchant_id(favorite_merchant_id)
  end

end
