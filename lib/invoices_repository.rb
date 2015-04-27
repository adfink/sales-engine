require 'csv'
require './lib/invoice'
require './lib/engine'

class InvoicesRepository
  attr_reader :invoices

  def initialize(engine, filepath)
    @engine = engine
    @invoices = generate_invoices(filepath)
  end

  def inspect
    "invoice repository containing #{@invoices.count} items"
  end

  def generate_invoices(filepath)
    file_contents = CSV.open filepath, headers: true, header_converters: :symbol
    file_contents.map{|row| Invoice.new(row, self)}
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

  def find_all_transactions_by_invoice_id(invoice_id)
    @engine.find_all_transactions_by_invoice_id(invoice_id)
  end

  def find_all_invoice_items_by_invoice_id(invoice_id)
    @engine.find_all_invoice_items_by_invoice_id(invoice_id)
  end

  def find_all_items_by_invoice_id(invoice_id)
    @engine.find_all_items_by_invoice_id(invoice_id)
  end

  def find_customer_by_customer_id(customer_id)
    @engine.find_customer_by_invoice_id(customer_id)
  end

  def find_merchant_by_merchant_id(merchant_id)
    @engine.find_merchant_by_merchant_id(merchant_id)
  end

  def am_i_successful?(id)
    @engine.is_this_invoice_successful?(id)
  end


end
