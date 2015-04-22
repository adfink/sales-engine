require 'csv'
require_relative 'invoice'

class InvoiceRepository
  attr_reader :invoices

  def initialize
    file_contents = CSV.open"./data/invoices.csv", headers: true, header_converters: :symbol
    @invoices = []
    file_contents.each do |row|
      invoice = Invoice.new
      invoice.id          = row[:id]
      invoice.customer_id = row[:customer_id]
      invoice.merchant_id = row[:merchant_id]
      invoice.status      = row[:status]
      invoice.created_at  = row[:created_at]
      invoice.updated_at  = row[:updated_at]
      @invoices << invoice
    end
  end

  def check_for_file
    File.exist? "./data/invoices.csv"
  end

  def output_file_contents
    File.read "./data/invoices.csv"
  end

  def all
    @invoices
  end

  def random
    @invoices.sample
  end

  def find_by_id(number)
    @invoices.find {|invoice| invoice.id == number}
  end

  def find_by_customer_id(customer_id)
    @invoices.find {|invoice| invoice.customer_id == customer_id}
  end

  def find_all_by_customer_id(customer_id)
    @invoices.find_all {|invoice| invoice.customer_id == customer_id}
  end

  def find_by_merchant_id(merchant_id)
    @invoices.find {|invoice| invoice.merchant_id == merchant_id}
  end

  def find_all_by_merchant_id(merchant_id)
    @invoices.find_all {|invoice| invoice.merchant_id == merchant_id}
  end

  def find_by_status(status)
    @invoices.find {|invoice| invoice.status == status}
  end

  def find_all_by_status(status)
    @invoices.find_all {|invoice| invoice.status == status}
  end

  def find_by_created_at(time)
    @invoices.find {|invoice| invoice.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    @invoices.find_all {|invoice| invoice.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    @invoices.find {|invoice| invoice.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    @invoices.find_all {|invoice| invoice.updated_at.to_s == time}
  end
end
