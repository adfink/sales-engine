require 'csv'
require_relative 'invoice_item'
require_relative 'engine'

class InvoiceItemsRepository
  attr_reader :invoice_items

  def initialize(engine, filepath)
    @engine = engine
    @invoice_items = generate_invoice_items(filepath)
  end

  def generate_invoice_items(filepath)
  file_contents = CSV.open filepath, headers: true, header_converters: :symbol
  file_contents.map{|row| InvoiceItem.new(row, self)}
  end

  def check_for_file
    File.exist?"./data/invoice_items.csv"
  end

  def output_file_contents
    File.read("data/invoice_items.csv")
  end

  def all
    @invoice_items
  end

  def random
    @invoice_items.sample
  end

  def find_by_id(number)
    @invoice_items.find {|invoice_item| invoice_item.id == number}
  end

  def find_by_invoice_id(number)
    @invoice_items.find {|invoice_item| invoice_item.invoice_id == number}
  end

  def find_all_by_invoice_id(number)
    @invoice_items.find_all {|invoice_item| invoice_item.invoice_id == number}
  end


  def find_by_item_id(number)
    @invoice_items.find {|invoice_item| invoice_item.item_id == number}
  end

  def find_all_by_item_id(number)
    @invoice_items.find_all {|invoice_item| invoice_item.item_id == number}
  end

  def find_by_quantity(number)
    @invoice_items.find {|invoice_item| invoice_item.quantity == number}
  end

  def find_all_by_quantity(number)
    @invoice_items.find_all {|invoice_item| invoice_item.quantity == number}
  end

  def find_by_unit_price(number)
    @invoice_items.find {|invoice_item| invoice_item.unit_price == number}
  end

  def find_all_by_unit_price(number)
    @invoice_items.find_all {|invoice_item| invoice_item.unit_price == number}
  end


  def find_by_created_at(time)
    @invoice_items.find {|invoice_item| invoice_item.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    @invoice_items.find_all {|invoice_item| invoice_item.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    @invoice_items.find {|invoice_item| invoice_item.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    @invoice_items.find_all {|invoice_item| invoice_item.updated_at.to_s == time}
  end
end




