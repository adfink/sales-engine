require 'csv'
require_relative 'item'
require_relative 'sales_engine'

class ItemRepository
  attr_reader :items,
              :engine

  def initialize(engine, filepath)
    @engine = engine
    @items = generate_items(filepath)
  end

  def inspect
    "item repository containing #{items.count} items"
  end

  def generate_items(filepath)
    output = CSV.open filepath, headers: true, header_converters: :symbol
    output.map{|row| Item.new(row, self)}
  end

  def all
    items
  end

  def random
    items.sample
  end

  def find_by_id(number)
    items.find {|item| item.id == number}
  end

  def find_by_name(name)
    items.find {|item| item.name == name}
  end

  def find_all_by_name(name)
    items.find_all {|item| item.name == name}
  end

  def find_by_description(description)
    items.find {|item| item.description == description}
  end

  def find_all_by_description(description)
    items.find_all {|item| item.description == description}
  end

  def find_by_unit_price(price)
    if price.class == BigDecimal
      real_price = (price.to_f*100).to_i
    else
      real_price = price
    end
    items.find {|item| item.unit_price == real_price}
  end

  def find_all_by_unit_price(price)
    items.find_all {|item| item.unit_price == price}
  end

  def find_by_merchant_id(merchant)
    items.find {|item| item.merchant_id == merchant}
  end

  def find_all_by_merchant_id(merchant_id)
    items.find_all {|item| item.merchant_id == merchant_id}
  end

  def find_by_created_at(time)
    items.find {|item| item.created_at.to_s == time}
  end

  def find_all_by_created_at(time)
    items.find_all {|item| item.created_at.to_s == time}
  end

  def find_by_updated_at(time)
    items.find {|item| item.updated_at.to_s == time}
  end

  def find_all_by_updated_at(time)
    items.find_all {|item| item.updated_at.to_s == time}
  end

  def find_all_invoice_items_by_item_id(item_id)
    engine.find_all_invoice_items_by_item_id(item_id)
  end

  def most_revenue(number_of_items)
   revenue_for_all_items =  items.map do |item|
     [item.revenue, item.id]
   end
   revenue_for_all_items.max_by(number_of_items) do |element|
     element
   end.map do |element|
     find_by_id(element[1])
   end
  end

  def most_items(number_of_items)
    sales_for_each_item_sorted = items.map do |item|
      [item.number_of_sales, item.id]
    end.sort.last(number_of_items).reverse
    sales_for_each_item_sorted.map do |element|
      find_by_id(element[1])
    end
  end

  def find_item_revenue(item_id)
    engine.find_this_items_revenue(item_id)
  end

  def find_item_sales_number(item_id)
    engine.find_this_items_sales_number(item_id)
  end

  def find_merchant(merchant_id)
    engine.find_merchant_by_merchant_id(merchant_id)
  end
end

