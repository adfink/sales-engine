require 'csv'
require_relative 'merchant'
require_relative 'sales_engine'
require 'pry'
require 'date'

class MerchantRepository
attr_reader :merchants,
            :engine

  def initialize(engine, filepath)
    @engine = engine
    @merchants = generate_merchants(filepath)
  end

  def inspect
    "merchant repository containing #{merchants.count} items"
  end

  def generate_merchants(filepath)
    output = CSV.open filepath, headers: true, header_converters: :symbol
    output.map{|row| Merchant.new(row, self)}
  end

  def check_for_file(filepath)
    File.exist?(filepath)
  end

  def output_file_contents(filepath)
    File.read(filepath)
  end

  def all
    merchants
  end

  def random
    merchants.sample
  end

  def find_revenue_by_id(id)
    engine.revenue_of_merchant_by_id(id)
  end

  def find_by_id(number)
    merchants.find {|merchant| merchant.id == number}
  end

  def find_by_name(name)
    merchants.find {|merchant| merchant.name == name}
  end

  def find_all_by_name(name)
    merchants.find_all {|merchant| merchant.name == name}
  end

  def find_by_created_at(time)
    merchants.find {|merchant| merchant.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    merchants.find_all {|merchant| merchant.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    merchants.find {|merchant| merchant.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    merchants.find_all {|merchant| merchant.updated_at.to_s == time}
  end

  def find_all_items_by_id(id)
    engine.find_all_items_by_merchant_id(id)
  end

  def find_all_invoices_by_merchant_id(id)
    engine.find_all_invoices_by_merchant_id(id)
  end

  def find_revenue_by_id_by_date(id, date)
    engine.revenue_by_merchant_id_and_invoice_date(id, date)
  end

  def find_successful_invoices(invoices)
    engine.find_successful_invoices(invoices)
  end

  def favorite_customer(successful_invoices)
    good_invoices = successful_invoices.group_by{|invoice| invoice.customer_id}
    best_customer_id = good_invoices.map{|k, v| [v.size, k]}.sort[-1][-1]
    engine.find_customer_by_customer_id(best_customer_id)
  end

  def find_customer_by_customer_id(customer_id)
    engine.customer_repository.find_by_id(customer_id)
  end

  def most_revenue(number_of_merchants)
    merchants_revenue = merchants.map do |merchant|
      [merchant.revenue, merchant.id]
    end
    sorted_merchants = merchants_revenue.sort.reverse.first(number_of_merchants)
    sorted_merchants.map{|element| find_by_id(element[1])}
  end

  def most_items(number_of_merchants)
    items = merchants.map do |merchant|
      [merchant.items_sold, merchant.id, merchant]
    end
    sorted_most_items = items.sort.reverse.first(number_of_merchants)
    sorted_most_items.map{|array| array[2]}
  end

  def find_all_items_by_merchant_id(id)
    engine.find_all_items_by_merchant_id(id)
  end

  def revenue(date)
    date = date.to_s
    merchants.reduce(0) do |sum, merchant|
      sum + merchant.revenue(date)
    end
  end
end
