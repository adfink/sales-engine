require 'csv'
require_relative 'customer'

class CustomerRepository
attr_reader :customers

  def initialize
    file_contents = CSV.open "./data/customers.csv", headers: true, header_converters: :symbol
    @customers = []
    file_contents.each do |row|
      customer = Customer.new
      customer.id = row[:id]
      customer.first_name = row[:first_name]
      customer.last_name = row[:last_name]
      customer.created_at = row[:created_at]
      customer.updated_at = row[:updated_at]
      @customers << customer
    end
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
end
