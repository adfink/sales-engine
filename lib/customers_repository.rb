require 'csv'
require './lib/customer'
require './lib/engine'

class CustomersRepository
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
end
