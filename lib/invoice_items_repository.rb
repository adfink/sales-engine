
require 'csv'
require_relative 'invoice_item'




class InvoiceItemsRepository
  attr_reader :invoice_items

  def initialize
    file_contents = CSV.open "./data/invoice_items.csv", headers: true, header_converters: :symbol
    @invoice_items = []
    file_contents.each do |row|
      invoice_item = InvoiceItem.new
      invoice_item.id = row[:id]
      invoice_item.item_id = row[:item_id]
      invoice_item.invoice_id = row[:invoice_id]
      invoice_item.quantity = row[:quantity]
      invoice_item.unit_price = row[:unit_price]
      invoice_item.created_at = row[:created_at]
      invoice_item.updated_at = row[:updated_at]
      @invoice_items << invoice_item
    end
  end

  def check_for_file
    File.exist?"./data/invoice_items.csv"
  end

  def output_file_contents
    contents = File.read("data/invoice_items.csv")
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




