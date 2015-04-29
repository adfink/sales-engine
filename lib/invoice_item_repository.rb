require 'csv'
require_relative 'invoice_item'
require_relative 'sales_engine'

class InvoiceItemRepository
  attr_reader :invoice_items

  def initialize(engine, filepath)
    @engine = engine
    @invoice_items = generate_invoice_items(filepath)
  end

  def inspect
    "invoice item repository containing #{@invoice_items.count} items"
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

  def find_all_by_invoice_id(invoice_id)
    @invoice_items.find_all {|invoice_item|
      invoice_item.invoice_id == invoice_id
    }
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
    @invoice_items.find_all {|invoice_item|
      invoice_item.created_at.to_s == time
    }
  end

  def find_by_updated_at(time)
    @invoice_items.find {|invoice_item| invoice_item.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    @invoice_items.find_all {|invoice_item|
      invoice_item.updated_at.to_s == time
    }
  end

  def find_invoice_by_invoice_id(invoice_id)
    @engine.find_invoice_by_invoice_id(invoice_id)
  end

  def find_item_by_item_id(item_id)
    @engine.find_item_by_item_id(item_id)
  end


  def am_i_successful?(invoice_id)
    @engine.is_this_invoice_successful?(invoice_id)
  end


  def add_items(items, invoice_id)

    items_hash = items.inject({}) do |hash, item|
      if hash[item]
        hash[item] += 1
      else
        hash[item] = 1
      end
      hash
    end
    item_and_quantity = items_hash
       .map{|item_object, quantity| [item_object, quantity]}
    item_and_quantity.each do |item_and_quantity|

      data = {
        :id         => next_id,
        :item_id    => item_and_quantity[0].id,
        :invoice_id => invoice_id,
        :quantity   => item_and_quantity[1],
        :unit_price => item_and_quantity[0].unit_price,
        :created_at => Time.now,
        :updated_at => Time.now
      }

      invoice_items << InvoiceItem.new(data, self)

    end
  end

  def next_id
    invoice_items.last.id.to_i + 1
  end
end




